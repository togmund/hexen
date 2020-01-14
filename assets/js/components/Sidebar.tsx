import * as React from 'react';
import Deck from './Deck';
import classNames from 'classnames';
import '../../css/Sidebar.css';

const Sidebar = (props: { state: any; targetHex: any; targetUser: any }) => {
  const { state, targetHex, targetUser } = props;
  const hexInfo: any = classNames('hex-info', 'pxl-border');
  const hexDetails: any = classNames('hex-details', 'pxl-border');

  return (
    <nav className={'sidebar'}>
      <h1>Hexen</h1>
      <div className={hexInfo}>
        <h3>{state.tile.name}</h3>
        <img
          src={state.tile.image}
          alt={state.tile.biome_name}
          onClick={() => targetHex(state.tile.id)}
          height="60px"
          width="60px"
        ></img>
        <div className={hexDetails}>
          <p>{state.tile.region_name}</p>
          <p>{state.tile.biome_name}</p>
          <p>{state.tile.resource}</p>
          <p>{state.tile.controlled_by}</p>
          <p>{state.tile.structure}</p>
        </div>
      </div>
      {/* Turn timer */}
      {/* <p>30</p> */}
      <Deck state={state} />
    </nav>
  );
};

export default Sidebar;
