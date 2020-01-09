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
import HexChannel from '../hex_channel';
import useApplicationData from '../hooks/useApplicationData';

const Map = () => {
  const {
    state
    // updateHand,
    // updateHex,
    // updateBand
  } = useApplicationData();

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
                HexChannel.init(socket, hex.id);
              }}
            >
              <Text>
                ID{hex.id} C{hex.hex.q},{hex.hex.r},{hex.hex.s}{' '}
                {HexChannel.state.name} {HexChannel.state.resource}{' '}
                {HexChannel.state.region_id} {HexChannel.state.biome_id}{' '}
                {HexChannel.state.band_id}
              </Text>
            </Hexagon>
          ))}
        </Layout>
      </HexGrid>
    </div>
  );
};

export default Map;
