import React from 'react';
import ReactDOM from 'react-dom'
import './HomePage.css'
import firstPhoto from '../media/photos/chefPhoto.jpg'

function Home(){
    return (
        <div>
            <h1 className='welcomeTitle'>QR Order</h1>
            <div  className="backgroundContainer">
                <img className='landingPhoto' src={firstPhoto}/>
            </div>
            
        </div>
      
    );
  }
  export default Home;