import React, { useState, useEffect } from 'react';
import {
  HexGrid,
  Layout,
  Hexagon,
  Text,
  GridGenerator,
  Hex
} from 'react-hexgrid';
<<<<<<< HEAD
=======
import Card from './Card';
>>>>>>> 2691af9b777a2f2a81d10f7db4ed224e27126122
import socket from '../socket';
import BandChannel from '../band';
import '../../css/Map.css';
import HexChannel from '../hex_channel';

const newHexagons = [
  {
    hex: new Hex(0, 0, 0),
    id: 1,
    name: 'FezJab',
    resource: 'Silver',
    region_id: 1,
    biome_id: 1,
    band_id: 1
  },
  {
    hex: new Hex(0, 1, -1),
    id: 3,
    name: 'MixZen',
    resource: 'Iron',
    structure: 'Mine',
    region_id: 3,
    biome_id: 3,
    band_id: 3
  },
  {
    hex: new Hex(1, 0, -1),
    id: 2,
    name: 'VoxJay',
    resource: 'Softwood',
    region_id: 2,
    biome_id: 2,
    band_id: 2
  },
  {
    hex: new Hex(2, 0, -1),
    id: 4,
    name: 'VoxJay',
    resource: 'Softwood',
    region_id: 2,
    biome_id: 2,
    band_id: 2
  },
  {
    hex: new Hex(3, -1, -3),
    id: 5,
    name: 'VoxJay',
    resource: 'Softwood',
    region_id: 2,
    biome_id: 2,
    band_id: 2
  }
];

const Map = () => {
  const [hexState, setHexState] = useState('');

  useEffect(() => {
    setHexState(HexChannel.state);
  });

  return (
<<<<<<< HEAD
    <div className={'hex-map'}>
      <HexGrid width={2000} height={950} viewBox={'0 -30 100 100'}>
        <Layout
          size={{ x: 15, y: 15 }}
          flat={true}
          spacing="1.005"
          origin={{ x: 0, y: 0 }}
        >
          {newHexagons.map((hex: any) => (
            <Hexagon
              key={hex.id}
              q={hex.hex.q}
              r={hex.hex.r}
              s={hex.hex.s}
              onClick={(event: any) => {
                console.log(event);
                HexChannel.init(socket, hex.id);
              }}
            >
              <Text>
                ID{hex.id} C{hex.hex.q},{hex.hex.r},{hex.hex.s}{' '}
                {HexChannel.state.name} {HexChannel.state.resource}{' '}
                {HexChannel.state.region_id} {HexChannel.state.biome_id}{' '}
                {HexChannel.state.band_id}
              </Text>
              <Text></Text>
            </Hexagon>
          ))}
        </Layout>
      </HexGrid>
    </div>
=======
    <main>
      <div className={'hex-map'}>
        <HexGrid width={2000} height={950} viewBox={'0 -30 100 100'}>
          <Layout
            size={{ x: 15, y: 15 }}
            flat={true}
            spacing="1.005"
            origin={{ x: 0, y: 0 }}
          >
            {newHexagons.map((hex: any) => (
              <Hexagon
                key={hex.id}
                q={hex.hex.q}
                r={hex.hex.r}
                s={hex.hex.s}
                onClick={(event: any) => {
                  console.log(event);
                  HexChannel.init(socket, hex.id);
                }}
              >
                <Text>
                  ID{hex.id} C{hex.hex.q},{hex.hex.r},{hex.hex.s}{' '}
                  {HexChannel.state.name} {HexChannel.state.resource}{' '}
                  {HexChannel.state.region_id} {HexChannel.state.biome_id}{' '}
                  {HexChannel.state.band_id}
                </Text>
                <Text></Text>
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
>>>>>>> 2691af9b777a2f2a81d10f7db4ed224e27126122
  );
};

export default Map;
