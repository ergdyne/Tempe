import { Request, Response } from "express"
import { getRepository, getManager } from "typeorm"
import { Group } from '../entity/Group'
import { User } from '../entity/User'
import { UserGroup } from '../entity/UserGroup'
import { FullUserGroup } from '../entity/ViewFullUserGroup'
import { GroupState } from '../entity/ViewGroupState'
import { ViewAdminAccess } from "../entity/ViewAdminAccess"

const groupAccessLevels = ['user', 'groupAdmin', 'requested', 'none']

//Group access deal

export default class UserController {
  //CONTROL
  //Promote/demote User (includes approve)
  //Admin - all - only admin can demote a groupAdmin. Only person with access to DB can remove admin rights
    //If someone has access to the DB, they aready have access to everything.
  //groupAdmin - can promote/demote requested/none to user, promote user/requested/none to groupAdmin

  static getUser = async (req: Request, res: Response) => {
    let { userId } = req.body
    //Need the user, admin access (for promotion option), and groups
    //CONTROL
      //Session group ids
      //If session is admin - OK
      //If session is groupAdmin -> must share group + fullUserGroups limited session groupAdmin
      //otherwise -> only session user information
    try{
      getRepository(User).findOneOrFail({ where: { id: userId } })
      .then(user => {
        getRepository(FullUserGroup).find({ where: { userId: userId } })
          .then(fullUserGroups => {
            const adminAccessRepo = getRepository(ViewAdminAccess)
            adminAccessRepo.findOne({ where: { userId: userId } })
              .then(adminAccess => {
                const userData = {
                  id: user.id,
                  email: user.email,
                  fullUserGroups: fullUserGroups,
                  isAdmin: (adminAccess == null) ? false : adminAccess.isAdmin
                }
                //success
                res.send(userData)
              })
          })
      }).catch(err=> res.status(400).send(err))
    }catch{
      res.status(400).send()
    }
  }
  static getAllUsers = async (req: Request, res: Response) => {
    //TODO check if user has authority
    //CONTROL
    //if user admin -All
    //if user groupAdmin -user from their groups
    //otherwise -> reject
    getRepository(FullUserGroup).find()
      .then(fugs =>
        res.send({ fullUserGroups: fugs })
      )

    //For any groups the user is groupAdmin -> 
    // .find({
    //   where: { groupId: In([3, 7, 9]) }
    // })
  }
  static addUser = async (req: Request, res: Response) => {
    //TODO check if user has authority
    //CONTROL
      //admin -> anything
      //groupAdmin -> only session groups with groupAdmin
    let { email, groupAccess, groupName } = req.body
    if (!(email && groupAccess && groupName && groupAccessLevels.includes(groupAccess))) {
      res.status(400).send()
      return
    }
    //Find if the user exists.
    getRepository(User).findOne({ where: { email: email } })
      .then(user => {
        if (user != null) {
          console.log('user exists')
          //If exists, then meh... maybe in the future will go through access
          res.status(409).send({ msg: 'email is already registered' })
          return
        }
        //OK, we can check on the group
        //Copy paste from Auth controller... so think about functions...
        try {
          getRepository(GroupState).findOneOrFail({ attribute: 'name', value: groupName })
            .then(groupState => {
              getRepository(Group).findOneOrFail(groupState.groupId)
                .then(group => {
                  //have a group and no user
                  //we want to create the user and user group
                  getManager().transaction(async transactionalEntityManager => {
                    let newUser = new User()
                    newUser.email = email.toLowerCase()
                    await transactionalEntityManager.save(newUser)
                    let userGroup = new UserGroup()
                    userGroup.group = group
                    userGroup.access = groupAccess
                    userGroup.user = newUser
                    await transactionalEntityManager.save(userGroup)
                  }).then(_ => res.send({ msg: 'user created' }))
                })
            })
        } catch (error) {
          res.status(401).send({ err: error, msg: 'some problem finding or creating' })
          return
        }

      }).catch(err =>
        res.status(400).send(err)
      )
  }
}