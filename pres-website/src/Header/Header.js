import React from 'react'
import './Header.css'
import headerBackground from '../media/videos/finalBackground1080.mp4'

function Header(){
    return(
        <div className='headerContainer'>
            <video className='headerVideo' autoPlay loop muted>
                <source src={headerBackground} type='video/mp4' />
            </video>
        </div>
    )
}
export default Header;