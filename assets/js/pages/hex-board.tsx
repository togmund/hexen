import * as React from 'react';
import { RouteComponentProps, Link } from 'react-router-dom';
import Main from '../components/Main';
import { HexGrid, Layout, Hexagon, GridGenerator } from 'react-hexgrid';

const hexagons = GridGenerator.parallelogram(-2, 3, -2, 1);
const HexBoard: React.FC = () => (
  <div className="HexBoard">
    <h1>Basic example of HexGrid usage.</h1>
    <HexGrid width={1200} height={1000}>
      <Layout size={{ x: 7, y: 7 }}>
        {hexagons.map(
          (hex: { q: any; r: any; s: any }, i: string | number | undefined) => (
            <Hexagon key={i} q={hex.q} r={hex.r} s={hex.s} />
          )
        )}
      </Layout>
    </HexGrid>
  </div>
);

export default HexBoard;
