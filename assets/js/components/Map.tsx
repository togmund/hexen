import React, { useState } from 'react';
import { HexGrid, Layout, Hexagon, Text, GridGenerator } from 'react-hexgrid';
import Card from './Card';
import socket from '../socket';
import BandChannel from '../band';
import '../../css/Map.css';

const LENGTH = 50;
const WIDTH = 50;
const hexagons = GridGenerator.orientedRectangle(LENGTH, WIDTH);
const initialState = Array(LENGTH * WIDTH).fill(0);

const Map = () => {
  const [count, setCount] = useState(initialState);

  const increaseCounter = (hexIndex: number) => {
    setCount(count[hexIndex] + 1);
    console.log('INDEX: ', hexIndex);
    console.log(count[hexIndex]);
  };

  return (
    <main>
      <div className={'hex-map'}>
        <HexGrid width={2000} height={950} viewBox={'49 -8 100 100'}>
          <Layout
            size={{ x: 6, y: 6 }}
            flat={true}
            spacing="1.005"
            origin={{ x: 0, y: 0 }}
          >
            {hexagons.map((hex: any, i: number) => (
              <Hexagon
                key={i}
                q={hex.q}
                r={hex.r}
                s={hex.s}
                onClick={() => increaseCounter(i)}
              >
                <Text>{count[i]}</Text>
              </Hexagon>
            ))}
          </Layout>
        </HexGrid>
      </div>
      <div className="card-container">
        <Card />
        <p>Card 2</p>
        <p>Card 3</p>
      </div>
    </main>
  );
};

export default Map;
