import React from 'react';
import ReactDOM from 'react-dom'
import './App.css'
import Landing from './LandingArea/landing'
import Description from './Description/Description'
import secondPhoto from'./media/photos/tableOrder.jpg'
import thirdPhoto from'./media/photos/tinyPeopleQR.jpg'

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

export default App;
