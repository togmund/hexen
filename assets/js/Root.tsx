import * as React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import Navbar from './components/Navbar';
import Sidebar from './components/Sidebar';
import Map from './components/Map';
import Hand from './components/Hand';
import useHexData from './hooks/useHexData';

const Root: React.FC = () => {
  const { state } = useHexData();
  return (
    <>
      <Navbar />
      <Sidebar />
      <div>
        <Map state={state} />
        <Hand state={state} />
      </div>
    </>
  );
};

export default Root;
