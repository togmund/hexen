import React, { useState, useEffect } from 'react';
import { HexGrid, Layout, Hexagon, Text, Pattern } from 'react-hexgrid';
import '../../css/Map.css';

const Map = (props: { state: any }) => {
  const { state } = props;

  return (
    <div className={'hex-map'}>
      <HexGrid width={'95vw'} height={'65vh'} viewBox={'-60 -200 125 200'}>
        <Layout
          size={{ x: 8, y: 8 }}
          flat={false}
          spacing={1.005}
          origin={{ x: -50, y: -50 }}
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
        <Pattern
          id="img-desert"
          link="https://s.put.re/DbxeC7th.png"
          size={{ x: 8, y: 8 }}
        />
      </HexGrid>
    </div>
  );
};

export default Map;
