import * as React from 'react';
import '../../css/Sidebar.css';

const Sidebar = (props: { state: any }) => {
  const { state } = props;
  return (
    <section>
      <h3>{state.tile.name}</h3>
      <img
        src={state.tile.image}
        alt={state.tile.biome_name}
        height="32px"
        width="48px"
      ></img>
      <ul>
        <li>{state.tile.region_name}</li>
        <li>{state.tile.biome_name}</li>
        <li>{state.tile.resource}</li>
        <li>{state.tile.controlled_by}</li>
        <li>{state.tile.structure}</li>
      </ul>
    </section>
  );
};

export default Sidebar;
