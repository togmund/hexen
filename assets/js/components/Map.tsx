import React, { useState, useEffect } from 'react';
import classNames from 'classnames';
import {
  HexGrid,
  Layout,
  Hexagon,
  Text,
  Pattern,
  HexUtils
} from 'react-hexgrid';
import * as _ from 'lodash';
import '../../css/Map.css';

const Map = (props: { state: any; targetHex: any }) => {
  const { state, targetHex } = props;

  const highlightHexes = (
    hexID: number,
    hexCoords: number[],
    highlightCurrent: boolean = true
  ): boolean => {
    const neighbourCoords = [];
    const neighbours = HexUtils.neighbours(state.tile);

    neighbours.forEach((hex: any) => {
      neighbourCoords.push([hex.q, hex.r, hex.s]);
    });

    let isCurrent = highlightCurrent && hexID === state.tile.id;
    let isNeighbour = false;

    neighbourCoords.forEach(arr => {
      if (_.isEqual(arr, hexCoords)) {
        isNeighbour = true;
      }
    });

    if (isCurrent || isNeighbour) {
      return false;
    }

    return true;
  };

  const getHexClasses = ({ id, q, r, s }) => {
    const hexClasses = classNames({
      'in-fog': highlightHexes(id, [q, r, s]),
      nearby: highlightHexes(id, [q, r, s], false)
    });

    return hexClasses;
  };

  return (
    <div className={'hex-map'}>
      <HexGrid width={'100vw'} height={'100vh'} viewBox={'20 -160 125 200'}>
        <Layout
          size={{ x: 10, y: 10 }}
          flat={true}
          spacing={1.085}
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
                className={getHexClasses(hex)}
                onClick={() => targetHex(hex.id)}
              >
                {/* <Text>{hex.id}</Text> */}
                <Pattern
                  id={HexUtils.getID(hex)}
                  link={hex.image}
                  size={{ x: 10, y: 10 }}
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
