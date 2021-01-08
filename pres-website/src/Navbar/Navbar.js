import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

import Home from '../HomePage/HomePage'
import About from '../AboutPage/AboutPage'
import Download from '../DownloadPage/DownloadPage'

export default function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul className='nav-links'>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/about">About</Link>
            </li>
            <li>
              <Link to="/download">Download</Link>
            </li>
          </ul>
        </nav>

        {/* A <Switch> looks through its children <Route>s and
            renders the first one that matches the current URL. */}
        <Switch>
          <Route exact path="/" component={Home} />
          <Route path="/about" component={About} />
          <Route path="/download" component={Download} />
        </Switch>
      </div>
    </Router>
  );
}



