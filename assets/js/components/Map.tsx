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

const Map = (props: { state: any; targetHex: any }) => {
  const { state, targetHex } = props;

  const checkInFog = (hexID: number, hexCoords: number[]) => {
    const neighbourCoords = [];
    const neighbours = HexUtils.neighbours(state.tile);
    neighbours.forEach((hex: any) => {
      neighbourCoords.push([hex.q, hex.r, hex.s]);
    });
    // console.log('Neighbour coords', neighbourCoords);
    if (hexID === state.tile.id || hexCoords === [5, 2, -7]) {
      return false;
    }

    return true;
  };

  return (
    <div className={'hex-map'}>
      <HexGrid width={'88vw'} height={'70vh'} viewBox={'-60 -200 125 200'}>
        <Layout
          size={{ x: 30, y: 30 }}
          flat={false}
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
                className={checkInFog(hex.id, [5, 2, -7]) ? 'in-fog' : ''}
                onClick={() => targetHex(hex.id)}
              >
                <Text>{hex.id}</Text>
                <Pattern
                  id={HexUtils.getID(hex)}
                  link={hex.image}
                  size={{ x: 30, y: 30 }}
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
