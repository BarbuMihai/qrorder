import React from 'react'
import './Header.css'
import Background from './Background.js'

function Header(){
    return (
        <div>
            <Background />
            <h1 className='WelcomeTitle'>QR Order</h1>
        </div>
    );
}

export default Header