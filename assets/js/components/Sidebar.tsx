import * as React from 'react';
import Deck from './Deck';
import HexPlayer from './HexPlayer';
import classNames from 'classnames';
import '../../css/Sidebar.css';

const Sidebar = (props: { state: any; targetHex: any; targetUser: any }) => {
  const { state, targetHex, targetUser } = props;
  const hexInfo: any = classNames('hex-info', 'pxl-border');
  const hexDetails: any = classNames('hex-details', 'pxl-border');
  const hexPlayers: any = classNames(
    'players-on-hex',
    'hex-details',
    'pxl-border'
  );

  return (
    <nav className={'sidebar'}>
      <h1 className={'pxl-border'}>Hexen</h1>
      <div className={hexInfo}>
        <p className={'hex-title'}>{state.tile.name}</p>
        <img
          src={state.tile.image}
          alt={state.tile.biome_name}
          onClick={() => targetHex(state.tile.id)}
          height="60px"
          width="60px"
        ></img>
        <div className={hexDetails}>
          {/* <p>
            Region:<br></br> {state.tile.region_name}
          </p> */}
          <p>
            Biome:<br></br> {state.tile.biome_name}
          </p>
          <p>
            Resource:<br></br> {state.tile.resource}
          </p>
          {/* <p>{state.tile.controlled_by}</p> */}
          <p>
            Structure:<br></br> {state.tile.structure}
          </p>
        </div>
      </div>
      {state.tile.hex_players ? (
        <div className={hexPlayers}>
          <h1>
            Players:<br></br>
          </h1>
          {Array.isArray(state.tile.hex_players) ? (
            state.tile.hex_players.map((player: any) => {
              return (
                <HexPlayer
                  key={player.id}
                  name={player.name}
                  avatar={[player.avatar]}
                ></HexPlayer>
              );
            })
          ) : (
            <div></div>
          )}
        </div>
      ) : (
        <></>
      )}
      <Deck state={state} />
    </nav>
  );
};

export default Sidebar;
