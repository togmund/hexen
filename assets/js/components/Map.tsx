import React, { useState, useEffect } from 'react';
import {
  HexGrid,
  Layout,
  Hexagon,
  Text,
  GridGenerator,
  Hex
} from 'react-hexgrid';
import socket from '../socket';
import BandChannel from '../band_channel';
import '../../css/Map.css';
import useHexData from '../hooks/useHexData';

const Map = () => {
  const {
    state,
    init
    // updateHand,
    // updateHex,
    // updateBand
  } = useHexData();

  return (
    <div className={'hex-map'}>
      <HexGrid width={1500} height={900} viewBox={'0 -30 100 100'}>
        <Layout
          size={{ x: 8, y: 8 }}
          flat={true}
          spacing="1.005"
          origin={{ x: -25, y: -15 }}
        >
          {state.hex_tiles.map((hex: any) => (
            <Hexagon
              key={hex.id}
              q={hex.hex.q}
              r={hex.hex.r}
              s={hex.hex.s}
              onClick={(event: any) => {
                console.log(event);
                init(socket, hex.id);
              }}
            >
              <Text></Text>
            </Hexagon>
          ))}
        </Layout>
      </HexGrid>
    </div>
  );
};

export default Map;
