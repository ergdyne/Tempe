import React from 'react'
import style from './App.css'
import NavBar from './components/NavBar'
import Footer from './components/Footer'
import {Landing,Patients} from './routes/routes'
import {navData} from './testData'

export default class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      page:`patients`,
      loggedIn: true
    }
  }

  //UpdatePage and content combine for the logic for switching page content with navBar clicks
  updatePage = (page) =>{
    this.setState({page:page})
    console.log(this.state.page)
  }

  content = () =>{
    switch (this.state.page){
      case 'patients': return(<Patients/>)
      default: return(<Landing/>)
    }
  }

  render() {
    return (
      <div className="theme-l5">
        <NavBar 
          data={navData} 
          updatePage={this.updatePage}
          loggedIn={this.state.loggedIn}
        />
        {this.content()}
        <br />
        <Footer/>
      </div>
    )
  }
}