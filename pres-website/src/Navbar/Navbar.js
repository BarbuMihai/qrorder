import React, {Component} from 'react'
import './Navbar.css'
import {Link} from 'react-router-dom'

class Navbar extends Component{
    render(){
        return(
            <nav className='navbarItems' >
                <h3>Logo</h3>
                <ul className='menuItemsLinks'>
                    <Link to='/about'>
                        <li>About</li>
                    </Link>
                    <Link to='/download'>
                        <li>Download</li>
                    </Link>
                </ul>
            </nav>
        )
    }
}

export default Navbar;