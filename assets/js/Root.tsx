import * as React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import Navbar from './components/Navbar';
import Sidebar from './components/Sidebar';
import Map from './components/Map';

const Root: React.FC = () => (
  <>
    <Navbar />
    <Sidebar />
    <Map />
  </>
);

export default Root;
