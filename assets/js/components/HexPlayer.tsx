import * as React from 'react';
import { Box, Image, Text } from 'rebass';

import '../../css/HexPlayer.css';

const HexPlayer = props => {
  const { name, avatar } = props;

  return (
    <Box className={'hex-player'}>
      <Text>{name}</Text>
      <Image src={avatar}></Image>
    </Box>
  );
};

export default HexPlayer;
