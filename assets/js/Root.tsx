import * as React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import Navbar from './components/Navbar';
import Sidebar from './components/Sidebar';
import Map from './components/Map';
import Hand from './components/Hand';
import useHexData from './hooks/useHexData';
import '../css/Root.css';

const Root: React.FC = () => {
  const { state } = useHexData();
  return (
    <div className="root-area">
      <Navbar />
      <div className="play-area">
        <Sidebar state={state} />
        <div className="board-area">
          <Map state={state} />
          <Hand state={state} />
        </div>
      </div>
    </div>
  );
};

export default Root;
