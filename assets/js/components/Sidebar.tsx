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
          height="90px"
          width="90px"
        ></img>
        <p>{state.tile.region_name}</p>
        <p>{state.tile.biome_name}</p>
        <p>{state.tile.resource}</p>
        <p>{state.tile.controlled_by}</p>
        <p>{state.tile.structure}</p>
      </div>
      {/* Turn timer */}
      <p>30</p>
      <Deck state={state} />
    </nav>
  );
};

export default Sidebar;
