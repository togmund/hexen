import React, { useState, useEffect } from 'react';
import { HexGrid, Layout, Hexagon, Text } from 'react-hexgrid';
import '../../css/Map.css';

const Map = (props: { state: any }) => {
  const { state } = props;

  return (
    <HexGrid
      className={'hex-map'}
      width={'70vw'}
      height={'70vh'}
      viewBox={'-50 -50 50 50'}
    >
      <Layout
        size={{ x: 8, y: 8 }}
        flat={true}
        spacing="1.005"
        origin={{ x: -50, y: 50 }}
      >
        {state.hex_tiles ? (
          state.hex_tiles.map((hex: any) => (
            <Hexagon key={hex.id} q={hex.q} r={hex.r} s={hex.s}>
              <Text>{hex.id}</Text>
            </Hexagon>
          ))
        ) : (
          <div></div>
        )}
      </Layout>
    </HexGrid>
  );
};

export default Map;
