import React, { Component } from 'react';
import './App.css';
import{Navbar, Nav, Icon, Dropdown} from 'rsuite'
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
  } from "react-router-dom";


import 'rsuite/dist/styles/rsuite-default.css';

  class Navb extends Component {
    render() {
      return(
        <Navbar>
    <Navbar.Header>
      <a href="#" className="navbar-brand logo">
        <Link className='HomeButton' to="/">Home</Link>
      </a>
    </Navbar.Header>
    <Navbar.Body>
      <Nav>
        <Nav.Item>About</Nav.Item>
        <Nav.Item>Download</Nav.Item>
        <Dropdown title="About">
          <Dropdown.Item>Company</Dropdown.Item>
          <Dropdown.Item>Team</Dropdown.Item>
          <Dropdown.Item>Contact</Dropdown.Item>
        </Dropdown>
      </Nav>
      <Nav pullRight>
        <Nav.Item icon={<Icon icon="cog" />} >Settings</Nav.Item>
      </Nav>
    </Navbar.Body>
  </Navbar> 
      );
    }
  }

  export default Navb;
/*
<Router>
        <nav className='navbar'>
          <Link className='HomeButton' to="/">Home</Link>
          <ul className='navlinks'>
            <li>
              <Link className='AboutButton' to="/about">About</Link>
            </li>
            <li>
              <Link className='DownloadButton' to="/download">Download</Link>
            </li>
          </ul>
        </nav>


            <Switch>
            <Route exact path="/" component={Home} />
            <Route path="/about" component={About} />
            <Route path="/download" component={Download} />
          </Switch>
      </Router>
*/
