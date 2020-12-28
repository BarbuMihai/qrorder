import React from 'react';
import Description from './Description/Description'
import Navbar from './Navbar/Navbar'
import Header from './Header/Header'
import About from './MenuComponents/About'
import Download from './MenuComponents/Download'
import './App.css'
import {BrowserRouter as Router, Switch, Route} from 'react-router-dom'


function App(){
  return (
    <div>
    <Router>
      <Switch>
        <div className='App'>
          <Navbar />
          <Route path='/' exact component={Header}/>
          <Route path='/about' exact component={About}/>
          <Route path='/download' exact component={Download}/>
        </div> 
      </Switch>
    </Router>
    
    </div>
    

  );
}

export default App;
