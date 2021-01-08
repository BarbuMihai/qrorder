import React from 'react'
import './AboutPage.css'
import scanGif from '../media/other/qrorder.png'
function Description(){
    return(
        <div className='descriptionSection'>
            <div className='qrgifScan'>
                <img src={scanGif} alt="loading..." width='300px' />
            </div>
            <div className='descriptionText'>
                <h1>
                Self service. Easy and fast.
                </h1>
                <h1>With the power of QR.</h1>
            </div>
            <div className='appLink'>
                <h3>
                    Download the app here.
                </h3>
                
            </div>
            
        </div>
    )
}
export default Description;
