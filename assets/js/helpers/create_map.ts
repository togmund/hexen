import { Hex } from 'react-hexgrid';

export default function createMap(numRows: number, numColumns: number) {
  const board: object[] = [];
  let hexNum = 1;
  let top = { x: 0, y: 0, z: 0 };

  for (let a = 0; a < numColumns; a++) {
    let evenCol = a % 2 === 0;

    for (let b = 0; b < (evenCol ? numRows - 1 : numRows); b++) {
      board.push({
        hex: new Hex(top.x + a, top.z + b, top.y - b),
        id: hexNum,
        name: 'FezJab',
        resource: 'Silver',
        region_id: 1,
        biome_id: 1,
        band_id: 1
      });

      hexNum++;
    }

    if (evenCol) {
      top.z--;
    } else {
      top.y--;
    }
  }

  return board;
}
