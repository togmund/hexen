import React, { useState, useEffect } from 'react';
import {
  HexGrid,
  Layout,
  Hexagon,
  Text,
  Pattern,
  HexUtils
} from 'react-hexgrid';
import '../../css/Map.css';

const Map = (props: { state: any }) => {
  const { state } = props;

  return (
    <div className={'hex-map'}>
      <HexGrid width={'95vw'} height={'75vh'} viewBox={'-60 -200 125 200'}>
        <Layout
          size={{ x: 10, y: 10 }}
          flat={true}
          spacing={1.005}
          origin={{ x: -100, y: -150 }}
        >
          {state.hex_tiles ? (
            state.hex_tiles.map((hex: any) => (
              <Hexagon
                key={hex.id}
                q={hex.q}
                r={hex.r}
                s={hex.s}
                fill={HexUtils.getID(hex)}
              >
                {/* <Text>{hex.id}</Text> */}
                <Pattern
                  id={HexUtils.getID(hex)}
                  link={hex.image}
                  size={{ x: 7, y: 7 }}
                />
              </Hexagon>
            ))
          ) : (
            <div></div>
          )}
        </Layout>
      </HexGrid>
    </div>
  );
};

export default Map;
