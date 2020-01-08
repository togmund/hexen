import * as React from 'react';
import '../../css/Sidebar.css';
import BandChannel from '../band_channel';
import HexChannel from '../hex_channel';
import socket from '../socket';

const Sidebar = () => (
  <section>
    <h3>Hex Title</h3>
    <img
      src="https://s.put.re/DPdo2W3p.png"
      alt="hex-img"
      height="130"
      width="150"
    ></img>
    <p>Hex details</p>
    <p>Bands present on this hex:</p>
    <p
      onClick={(event: any) => {
        console.log(event);
        BandChannel.init(socket);
      }}
    >
      The Bloods
    </p>
    <button
      onClick={(event: any) => {
        console.log(event);
        HexChannel.init(socket, 1);
      }}
    >
      Subscribe
    </button>
    <button
      onClick={(event: any) => {
        console.log(event);
        HexChannel.leave(socket, 1);
      }}
    >
      Unsubscribe
    </button>
  </section>
);

export default Sidebar;
