import React from 'react'
import backVideo from '../media/videos/finalBackground720.mp4';
import './Background.css'

function Background(){
    return (
        <div>
            <video className='backg' autoPlay loop muted>
                <source src={backVideo} type='video/mp4' />
            </video>
        </div>
    );
}

export default Background