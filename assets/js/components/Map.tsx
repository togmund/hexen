import * as React from 'react';
import {
  HexGrid,
  Layout,
  Hexagon,
  Text,
  Pattern,
  Path,
  Hex,
  GridGenerator
} from 'react-hexgrid';
import Card from './Card';
import '../../css/Map.css';
import socket from '../socket';
import HexChannel from '../hex_channel';

const hexagons = GridGenerator.orientedRectangle(50, 50);

const Map = () => (
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
              onClick={(event: any) => {
                console.log(event);
                HexChannel.init(socket);
              }}
            />
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

export default Map;
