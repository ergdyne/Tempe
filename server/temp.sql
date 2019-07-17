
-- Inserts for test case if I have to rebuild the DB

--Probably need a user seed too

-- write a seed...

drop view full_user_group ;
drop view group_state ;
drop view user_group_state;
drop view view_admin_access ;
drop view view_patient_group;
drop view view_site_auth ;
drop view ux_state;
drop view ux_record_state;
drop view patient_record_state;
drop view patient_build_record_state;

drop table migrations;
drop table typeorm_metadata;

--Version 0.4

insert into "build" (create_at) values (current_timestamp);

insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','groupName','string',1);insert into record_attribute (attribute, "value","type","recordId") values ('name','Group','string',1);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',1);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','select','string',1);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','Select Group','string',1);insert into record_attribute (attribute, "value","type","recordId") values ('optionStore','groupOptions','string',1);insert into record_attribute (attribute, "value","type","recordId") values ('validation-required',TRUE,'boolean',1);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','id','string',2);insert into record_attribute (attribute, "value","type","recordId") values ('type','id','string',2);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','firstName','string',3);insert into record_attribute (attribute, "value","type","recordId") values ('name','First Name','string',3);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',3);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',3);insert into record_attribute (attribute, "value","type","recordId") values ('validation-required',TRUE,'boolean',3);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','lastName','string',4);insert into record_attribute (attribute, "value","type","recordId") values ('name','Last Name','string',4);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',4);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',4);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','dateOfBirth','string',5);insert into record_attribute (attribute, "value","type","recordId") values ('name','Date of Birth','string',5);insert into record_attribute (attribute, "value","type","recordId") values ('type','date','string',5);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','date','string',5);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','dateOFAmputation','string',6);insert into record_attribute (attribute, "value","type","recordId") values ('name','Amputation Date','string',6);insert into record_attribute (attribute, "value","type","recordId") values ('type','date','string',6);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','date','string',6);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','city','string',7);insert into record_attribute (attribute, "value","type","recordId") values ('name','City','string',7);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',7);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',7);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','country','string',8);insert into record_attribute (attribute, "value","type","recordId") values ('name','Country','string',8);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',8);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',8);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','gender','string',9);insert into record_attribute (attribute, "value","type","recordId") values ('name','Gender','string',9);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',9);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','radio','string',9);insert into record_attribute (attribute, "value","type","recordId") values ('validation-required',TRUE,'boolean',9);insert into record_attribute (attribute, "value","type","recordId") values ('option-0','Male','string',9);insert into record_attribute (attribute, "value","type","recordId") values ('option-1','Female','string',9);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','side','string',10);insert into record_attribute (attribute, "value","type","recordId") values ('name','Amputation Side','string',10);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',10);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','radio','string',10);insert into record_attribute (attribute, "value","type","recordId") values ('validation-required',TRUE,'boolean',10);insert into record_attribute (attribute, "value","type","recordId") values ('option-0','Left','string',10);insert into record_attribute (attribute, "value","type","recordId") values ('option-1','Right','string',10);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','amputationCause','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('name','Amputation Cause','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','select','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','Select Cause','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-0','Congenital','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-1','Diabetes','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-2','Traffic accident','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-3','Cancer','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-4','Burn','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-5','Frostbite','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-6','Industrial accident','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-7','Electrocution','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-8','Natural disaster','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-9','Infection','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-10','Conflict','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-11','Unknown','string',11);insert into record_attribute (attribute, "value","type","recordId") values ('option-12','Other','string',11);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','nozzleSize','string',12);insert into record_attribute (attribute, "value","type","recordId") values ('name','Nozzle Size','string',12);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',12);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','select','string',12);insert into record_attribute (attribute, "value","type","recordId") values ('default',TRUE,'boolean',12);insert into record_attribute (attribute, "value","type","recordId") values ('validation-required',TRUE,'boolean',12);insert into record_attribute (attribute, "value","type","recordId") values ('option-0','0.4mm','string',12);insert into record_attribute (attribute, "value","type","recordId") values ('option-1','0.6mm','string',12);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','amputationLevel','string',13);insert into record_attribute (attribute, "value","type","recordId") values ('name','Amputation Level','string',13);insert into record_attribute (attribute, "value","type","recordId") values ('type','string','string',13);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','select','string',13);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','Select Level','string',13);insert into record_attribute (attribute, "value","type","recordId") values ('validation-required',TRUE,'boolean',13);insert into record_attribute (attribute, "value","type","recordId") values ('option-0','Transradial','string',13);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','l1','string',14);insert into record_attribute (attribute, "value","type","recordId") values ('name','L1','string',14);insert into record_attribute (attribute, "value","type","recordId") values ('type','float','string',14);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',14);insert into record_attribute (attribute, "value","type","recordId") values ('step',1,'float',14);insert into record_attribute (attribute, "value","type","recordId") values ('instruction','Measure length.','string',14);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','XX.X','string',14);insert into record_attribute (attribute, "value","type","recordId") values ('validation-min',18,'float',14);insert into record_attribute (attribute, "value","type","recordId") values ('validation-max',32,'float',14);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','l2','string',15);insert into record_attribute (attribute, "value","type","recordId") values ('name','L2','string',15);insert into record_attribute (attribute, "value","type","recordId") values ('type','float','string',15);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',15);insert into record_attribute (attribute, "value","type","recordId") values ('instruction','Measure length.','string',15);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','XX.X','string',15);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','l4','string',16);insert into record_attribute (attribute, "value","type","recordId") values ('name','L4','string',16);insert into record_attribute (attribute, "value","type","recordId") values ('type','float','string',16);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',16);insert into record_attribute (attribute, "value","type","recordId") values ('step',0.5,'float',16);insert into record_attribute (attribute, "value","type","recordId") values ('instruction','Measure length.','string',16);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','XX.X','string',16);insert into record_attribute (attribute, "value","type","recordId") values ('validation-min',14,'float',16);insert into record_attribute (attribute, "value","type","recordId") values ('validation-max',19,'float',16);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','c1','string',17);insert into record_attribute (attribute, "value","type","recordId") values ('name','C1','string',17);insert into record_attribute (attribute, "value","type","recordId") values ('type','float','string',17);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',17);insert into record_attribute (attribute, "value","type","recordId") values ('step',0.5,'float',17);insert into record_attribute (attribute, "value","type","recordId") values ('instruction','Measure circumference.','string',17);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','XX.X','string',17);insert into record_attribute (attribute, "value","type","recordId") values ('validation-min',14.5,'float',17);insert into record_attribute (attribute, "value","type","recordId") values ('validation-max',18,'float',17);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','c2','string',18);insert into record_attribute (attribute, "value","type","recordId") values ('name','C2','string',18);insert into record_attribute (attribute, "value","type","recordId") values ('type','float','string',18);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',18);insert into record_attribute (attribute, "value","type","recordId") values ('instruction','Measure circumference.','string',18);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','XX.X','string',18);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','c3','string',19);insert into record_attribute (attribute, "value","type","recordId") values ('name','C3','string',19);insert into record_attribute (attribute, "value","type","recordId") values ('type','float','string',19);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',19);insert into record_attribute (attribute, "value","type","recordId") values ('instruction','Measure circumference.','string',19);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','XX.X','string',19);
insert into "record" (create_at) values (current_timestamp);insert into record_attribute (attribute, "value","type","recordId") values ('accessor','c4','string',20);insert into record_attribute (attribute, "value","type","recordId") values ('name','C4','string',20);insert into record_attribute (attribute, "value","type","recordId") values ('type','float','string',20);insert into record_attribute (attribute, "value","type","recordId") values ('inputType','text','string',20);insert into record_attribute (attribute, "value","type","recordId") values ('step',0.5,'float',20);insert into record_attribute (attribute, "value","type","recordId") values ('instruction','Measure circumference.','string',20);insert into record_attribute (attribute, "value","type","recordId") values ('placeholder','XX.X','string',20);insert into record_attribute (attribute, "value","type","recordId") values ('validation-min',20,'float',20);insert into record_attribute (attribute, "value","type","recordId") values ('validation-max',28,'float',20);

insert into "ux" ("accessor") values ('selectGroup');insert into ux_attribute (attribute, "value","type","uXId") values ('button','Select','string',1);insert into ux_attribute (attribute, "value","type","uXId") values ('preventDefault',TRUE,'boolean',1);insert into ux_record ("order", "recordId","uXId") values (0,1,1);
insert into "ux" ("accessor") values ('patientData');insert into ux_attribute (attribute, "value","type","uXId") values ('name','Patient','string',2);insert into ux_attribute (attribute, "value","type","uXId") values ('button','Save','string',2);insert into ux_attribute (attribute, "value","type","uXId") values ('preventDefault',TRUE,'boolean',2);insert into ux_record ("order", "recordId","uXId") values (0,3,2);insert into ux_record ("order", "recordId","uXId") values (1,4,2);insert into ux_record ("order", "recordId","uXId") values (2,5,2);insert into ux_record ("order", "recordId","uXId") values (3,6,2);insert into ux_record ("order", "recordId","uXId") values (4,7,2);insert into ux_record ("order", "recordId","uXId") values (5,8,2);insert into ux_record ("order", "recordId","uXId") values (6,9,2);insert into ux_record ("order", "recordId","uXId") values (7,11,2);
insert into "ux" ("accessor") values ('addBuild');insert into ux_attribute (attribute, "value","type","uXId") values ('name','Add Build','string',3);insert into ux_attribute (attribute, "value","type","uXId") values ('button','Add','string',3);insert into ux_attribute (attribute, "value","type","uXId") values ('preventDefault',TRUE,'boolean',3);insert into ux_record ("order", "recordId","uXId") values (0,10,3);insert into ux_record ("order", "recordId","uXId") values (1,12,3);
insert into "ux" ("accessor") values ('transradialBuild');insert into ux_attribute (attribute, "value","type","uXId") values ('name','Measurements','string',4);insert into ux_attribute (attribute, "value","type","uXId") values ('button','Save','string',4);insert into ux_attribute (attribute, "value","type","uXId") values ('preventDefault',TRUE,'boolean',4);insert into ux_record ("order", "recordId","uXId") values (0,14,4);insert into ux_record ("order", "recordId","uXId") values (1,15,4);insert into ux_record ("order", "recordId","uXId") values (2,16,4);insert into ux_record ("order", "recordId","uXId") values (3,17,4);insert into ux_record ("order", "recordId","uXId") values (4,18,4);insert into ux_record ("order", "recordId","uXId") values (5,19,4);insert into ux_record ("order", "recordId","uXId") values (6,20,4);
insert into "ux" ("accessor") values ('patientCols');insert into ux_record ("order", "recordId","uXId") values (0,2,5);insert into ux_record ("order", "recordId","uXId") values (1,3,5);insert into ux_record ("order", "recordId","uXId") values (2,4,5);insert into ux_record ("order", "recordId","uXId") values (3,5,5);insert into ux_record ("order", "recordId","uXId") values (4,6,5);insert into ux_record ("order", "recordId","uXId") values (5,7,5);insert into ux_record ("order", "recordId","uXId") values (6,8,5);insert into ux_record ("order", "recordId","uXId") values (7,9,5);insert into ux_record ("order", "recordId","uXId") values (8,11,5);insert into ux_record ("order", "recordId","uXId") values (9,13,5);insert into ux_record ("order", "recordId","uXId") values (10,10,5);insert into ux_record ("order", "recordId","uXId") values (11,1,5);


--TEST DATA
insert into ux_record ("order", "recordId","uXId") values (-1,12,3);
insert into ux_record ("order", "recordId","uXId") values (1,12,3);
insert into ux_record ("order", "recordId","uXId") values (-1,3,3);
insert into ux_record ("order", "recordId","uXId") values (1,3,3);
insert into ux_record ("order", "recordId","uXId") values (-1,3,3);

insert into "patient" (create_at) values (current_timestamp); --27
--build is 1 or 2

insert into patient_build ("patientId", "buildId") values (27,1); --1

insert into patient_record ("patientId", "recordId", "value") values (27,3, 'John');
insert into patient_record ("patientId", "recordId", "value") values (27,4, 'Smite');
insert into patient_record ("patientId", "recordId", "value") values (27,4, 'Smith');
insert into patient_record ("patientId", "recordId", "value") values (27,5, current_timestamp);

insert into patient_build_record ("patientBuildId", "recordId", "value") values (1,14, '27.4');
insert into patient_build_record ("patientBuildId", "recordId", "value") values (1,15, '16.4');
insert into patient_build_record ("patientBuildId", "recordId", "value") values (1,15, '17.4');


--Record State --Include in any where record needed
    select l.parentId as "recordId", ot.attribute, ot.value, ot.type from 
      (
        select 
          "recordId" as parentId, 
          max(create_at) as latest, 
          attribute
        from record_attribute
        group by "recordId", attribute
      ) as l
    inner join record_attribute as ot
    on l.parentId = ot."recordId" and l.latest = ot.create_at and l.attribute = ot.attribute

--UX State
    select ux.id , ux.accessor, ot.attribute, ot.value, ot.type from 
    ux left outer join
      (
        select 
          "uXId" as parentId, 
          max(create_at) as latest, 
          attribute
        from ux_attribute
        group by "uXId", attribute
      ) as l
    on ux.id = l.parentId
    left outer join ux_attribute as ot
    on l.parentId = ot."uXId" and l.latest = ot.create_at and l.attribute = ot.attribute

--UX Record State
    select ux.id, ux.accessor, uxrs."recordId", uxrs."order",rs.attribute, rs.value, rs.type from
    ux left outer join
    (
      select l.parentId as "uXId", ot."recordId", ot."order" from 
        (
          select 
            "uXId" as parentId, 
            max(create_at) as latest, 
            "recordId"
          from ux_record
          group by "uXId", "recordId"
        ) as l
      inner join ux_record as ot
      on l.parentId = ot."uXId" and l.latest = ot.create_at and l."recordId" = ot."recordId"
      where "order" > -1
    ) as uxrs
    on ux.id = uxrs."uXId"
    left outer join
    (
      select l.parentId as "recordId", ot.attribute, ot.value, ot.type from 
        (
          select 
            "recordId" as parentId, 
            max(create_at) as latest, 
            attribute
          from record_attribute
          group by "recordId", attribute
        ) as l
      inner join record_attribute as ot
      on l.parentId = ot."recordId" and l.latest = ot.create_at and l.attribute = ot.attribute
    ) as rs
    on uxrs."recordId" = rs."recordId"

-- Patient Record State
      select l.parentId as "patientId", ot."recordId", ot."value", ras.accessor,rts."type" from 
        (
          select 
            "patientId" as parentId, 
            max(create_at) as latest, 
            "recordId"
          from patient_record
          group by "patientId", "recordId"
        ) as l
      inner join patient_record as ot
      on l.parentId = ot."patientId" and l.latest = ot.create_at and l."recordId" = ot."recordId"  
      inner join
      (select l.parentId as "recordId", ot.value as accessor from 
        (
          select 
            "recordId" as parentId, 
            max(create_at) as latest, 
            attribute
          from record_attribute
          where attribute = 'accessor'
          group by "recordId", attribute
        ) as l
      inner join record_attribute as ot
      on l.parentId = ot."recordId" and l.latest = ot.create_at and l.attribute = ot.attribute
      ) as ras
      on ot."recordId" = ras."recordId"
      inner join
      (select l.parentId as "recordId", ot.value as "type" from 
        (
          select 
            "recordId" as parentId, 
            max(create_at) as latest, 
            attribute
          from record_attribute
          where attribute = 'type'
          group by "recordId", attribute
        ) as l
      inner join record_attribute as ot
      on l.parentId = ot."recordId" and l.latest = ot.create_at and l.attribute = ot.attribute
      ) as rts
      on ot."recordId" = rts."recordId"


-- Patient Build Record State -- in the future will have to add build information too
      select pb."patientId", pb.id as "patientBuildId", ot."recordId", ot."value", ras.accessor,rts."type"  from
      patient_build as pb
      inner join
        (
          select 
            "patientBuildId" as parentId, 
            max(create_at) as latest, 
            "recordId"
          from patient_build_record
          group by "patientBuildId", "recordId"
        ) as l
      on l.parentId = pb.id
      inner join patient_build_record as ot
      on l.parentId = ot."patientBuildId" and l.latest = ot.create_at and l."recordId" = ot."recordId"  
      inner join
      (select l.parentId as "recordId", ot.value as accessor from 
        (
          select 
            "recordId" as parentId, 
            max(create_at) as latest, 
            attribute
          from record_attribute
          where attribute = 'accessor'
          group by "recordId", attribute
        ) as l
      inner join record_attribute as ot
      on l.parentId = ot."recordId" and l.latest = ot.create_at and l.attribute = ot.attribute
      ) as ras
      on ot."recordId" = ras."recordId"
      inner join
      (select l.parentId as "recordId", ot.value as "type" from 
        (
          select 
            "recordId" as parentId, 
            max(create_at) as latest, 
            attribute
          from record_attribute
          where attribute = 'type'
          group by "recordId", attribute
        ) as l
      inner join record_attribute as ot
      on l.parentId = ot."recordId" and l.latest = ot.create_at and l.attribute = ot.attribute
      ) as rts
      on ot."recordId" = rts."recordId"

