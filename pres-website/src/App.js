import React from 'react';
import ReactDOM from 'react-dom'
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";

import './App.css'

import Nav from './Navbar/Navbar'
import Landing from './HomePage/HomePage'
import Description from './AboutPage/AboutPage'
import secondPhoto from'./media/photos/tableOrder.jpg'
import thirdPhoto from'./media/photos/tinyPeopleQR.jpg'


function App(){
  return (
    <div>
      <Nav />
    </div>
  );
}

export default App;

/*
function App(){
  return (
    <div>
      <Landing />
      <Description />
      <img className='secondPhoto' src={secondPhoto}/>
      <img className='thirdPhoto' src={thirdPhoto}/>
    </div>
  );
}
*/

