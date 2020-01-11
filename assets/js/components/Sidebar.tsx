import * as React from 'react';
import Deck from './Deck';
import '../../css/Sidebar.css';

const Sidebar = (props: { state: any }) => {
  const { state } = props;
  return (
    <nav className={'sidebar'}>
      <div className={'hex-info'}>
        <h3>{state.tile.name}</h3>
        <img
          src={state.tile.image}
          alt={state.tile.biome_name}
          height="48px"
          width="32px"
        ></img>
        <ul>
          <li>{state.tile.region_name}</li>
          <li>{state.tile.biome_name}</li>
          <li>{state.tile.resource}</li>
          <li>{state.tile.controlled_by}</li>
          <li>{state.tile.structure}</li>
        </ul>
      </div>
      <Deck state={state} />
    </nav>
  );
};

export default Sidebar;
