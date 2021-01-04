import React from 'react';
import ReactDOM from 'react-dom'
import './landing.css'
import firstPhoto from '../media/photos/chefPhoto.jpg'

function Landing(){
    return (
        <div>
            <h1 className='welcomeTitle'>QR Order</h1>
            <div  className="backgroundContainer">
                <img className='landingPhoto' src={firstPhoto}/>
            </div>
            
        </div>
      
    );
  }
  export default Landing;