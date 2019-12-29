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

const hexagons = GridGenerator.orientedRectangle(5, 5);

const Map = () => (
  <main>
    <div className={'hex-map'}>
      <HexGrid width={1500} height={950} viewBox={'0 0 100 100'}>
        <Layout
          size={{ x: 6, y: 6 }}
          flat="true"
          spacing="1.005"
          origin={{ x: 0, y: 0 }}
        >
          {hexagons.map((hex: any, i: number) => (
            <Hexagon key={i} q={hex.q} r={hex.r} s={hex.s} />
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
