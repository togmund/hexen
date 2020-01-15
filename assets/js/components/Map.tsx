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
      nearby: highlightHexes(id, [q, r, s], false),
      quest: state.quest_hexes.includes(id)
    });

    return hexClasses;
  };

  return (
    <div className={'hex-map'}>
      <HexGrid width={'150vw'} height={'200vh'} viewBox={'20 -10 350 450'}>
        <Layout
          size={{ x: 10, y: 10 }}
          flat={true}
          spacing={1.085}
          origin={{ x: 0, y: 0 }}
        >
          {state.hex_tiles ? (
            state.hex_tiles.map((hex: any) => (
              <>
                <Hexagon
                  key={hex.id}
                  q={hex.q}
                  r={hex.r}
                  s={hex.s}
                  fill={hex.image}
                  className={getHexClasses(hex)}
                  onClick={() => targetHex(hex.id)}
                >
                  <Text>{`${hex.q} ${hex.r} ${hex.s}`}</Text>
                </Hexagon>
                <Hexagon
                  key={hex.id + 10000}
                  q={hex.q}
                  r={hex.r}
                  s={hex.s}
                  fill={
                    state.tile.id === hex.id
                      ? state.player.avatar
                      : state.quest_hexes.includes(hex.id)
                      ? 'quest'
                      : hex.structure
                      ? hex.structure
                      : 'none'
                  }
                  onClick={() => targetHex(hex.id)}
                >
                  {/* <Text>{hex.id}</Text> */}
                </Hexagon>
              </>
            ))
          ) : (
            <div></div>
          )}
        </Layout>
        {/* <Layout
          size={{ x: 10, y: 10 }}
          flat={true}
          spacing={1.085}
          origin={{ x: -100, y: -150 }}
        >
          {state.hex_tiles ? (
            state.hex_tiles.map((hex: any) => (

            ))
          ) : (
            <div></div>
          )}
        </Layout> */}
        {/* Biome Images */}
        <Pattern
          id={'https://i.ibb.co/F7kbcFh/snow-resize.png'}
          link={'https://i.ibb.co/F7kbcFh/snow-resize.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/P4tK7xx/mountain-rotate.png'}
          link={'https://i.ibb.co/P4tK7xx/mountain-rotate.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/t8NgLbQ/grassland-rotate.png'}
          link={'https://i.ibb.co/t8NgLbQ/grassland-rotate.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/WWFQDhJ/purple-rotate.png'}
          link={'https://i.ibb.co/WWFQDhJ/purple-rotate.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/VmYLRTB/grass-rotate.png'}
          link={'https://i.ibb.co/VmYLRTB/grass-rotate.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/h1j86hg/hex1-rotated.png'}
          link={'https://i.ibb.co/h1j86hg/hex1-rotated.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/MVW4XfV/orange-rotate.png'}
          link={'https://i.ibb.co/MVW4XfV/orange-rotate.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/S34xwsx/swamp-rotate.png'}
          link={'https://i.ibb.co/S34xwsx/swamp-rotate.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/RHsVg4m/dunes-rotate.png'}
          link={'https://i.ibb.co/RHsVg4m/dunes-rotate.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/842VhsT/river-rotate.png'}
          link={'https://i.ibb.co/842VhsT/river-rotate.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/tzRxjH5/ocean-rotate.png'}
          link={'https://i.ibb.co/tzRxjH5/ocean-rotate.png'}
          size={{ x: 10, y: 10 }}
        />

        {/* On-hex-Sprites */}
        <Pattern
          id={'quest'}
          link={'https://i.ibb.co/JmRTqB0/Zk-D80aw-8x.png'}
          size={{ x: 10, y: 10 }}
        />
        <Pattern
          id={'https://i.ibb.co/BLVmD9d/p-CFxi-UE-21x.png'}
          link={'https://i.ibb.co/BLVmD9d/p-CFxi-UE-21x.png'}
          size={{ x: 9, y: 7 }}
        />
        <Pattern
          id={'https://i.ibb.co/YjQKfWM/KPh-MIj-F-21x.png'}
          link={'https://i.ibb.co/YjQKfWM/KPh-MIj-F-21x.png'}
          size={{ x: 9, y: 7 }}
        />
        <Pattern
          id={'https://i.ibb.co/kHRFRgf/Ro3-Id-YE-15x.png'}
          link={'https://i.ibb.co/kHRFRgf/Ro3-Id-YE-15x.png'}
          size={{ x: 9, y: 7 }}
        />
        <Pattern
          id={'https://i.ibb.co/C91X3QR/gu-DVXhg-21x.png'}
          link={'https://i.ibb.co/C91X3QR/gu-DVXhg-21x.png'}
          size={{ x: 9, y: 7 }}
        />
        <Pattern
          id={'https://i.ibb.co/LCfCZq3/wt-BBx7-D-15x.png'}
          link={'https://i.ibb.co/LCfCZq3/wt-BBx7-D-15x.png'}
          size={{ x: 9, y: 7 }}
        />
        <Pattern
          id={'https://i.ibb.co/J2YWdrG/gwt-RAVi-15x.png'}
          link={'https://i.ibb.co/J2YWdrG/gwt-RAVi-15x.png'}
          size={{ x: 9, y: 7 }}
        />
        <Pattern id={'none'} />
      </HexGrid>
    </div>
  );
};

export default Map;
