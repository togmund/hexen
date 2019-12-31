import * as React from 'react';
import '../../css/Sidebar.css';
import BandChannel from '../band';
import socket from '../socket';

const Sidebar = () => (
  <section>
    <h3>Hex Title</h3>
    {/* <img src={require('../../images/hexagon.png')} alt="hex-img"></img> */}
    <img src="../../images/hexagon.png" alt="hex-img"></img>
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
  </section>
);

export default Sidebar;
