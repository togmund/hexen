import React, { useState, useEffect } from 'react';
import { HexGrid, Layout, Hexagon, Text } from 'react-hexgrid';
import socket from '../socket';
import BandChannel from '../band_channel';
import '../../css/Map.css';
import useHexData from '../hooks/useHexData';

const Map = (props: any) => {
  const { state } = props;

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
            <Hexagon key={hex.id} q={hex.q} r={hex.r} s={hex.s}>
              <Text>{hex.id}</Text>
            </Hexagon>
          ))}
        </Layout>
      </HexGrid>
    </div>
  );
};

export default Map;
