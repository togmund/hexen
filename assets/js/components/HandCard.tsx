import * as React from 'react';
import { Box, Card, Image, Heading, Text } from 'rebass';
import '../../css/HandCard.css';

const HandCard = ({
  image,
  suit,
  name,
  description,
  modifier,
  selected,
  selectCard
}) => {
  return (
    <Box
      className="hand-card"
      onClick={selectCard}
      sx={{
        p: 1,
        borderRadius: 10,
        boxShadow: '0 0 16px rgba(0, 0, 0, .25)'
      }}
    >
      <Card>
        <Text>{name}</Text>

        <Image src={image} />
        <Box>
          <Text>{suit}</Text>
          <Text>{description}</Text>
          <Text>{modifier}</Text>
        </Box>
      </Card>
    </Box>
  );
};

export default HandCard;
