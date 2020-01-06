import * as React from 'react';
import { Box, Card, Image, Heading, Text } from 'rebass';

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
      onClick={selectCard}
      sx={{
        p: 1,
        borderRadius: 10,
        boxShadow: '0 0 16px rgba(0, 0, 0, .25)'
      }}
    >
      <Card>
        <Image src={image} />
        <Box>
          <Heading as="h3">{name}</Heading>
          <Heading as="h3">{suit}</Heading>
          <Text>{description}</Text>
          <Text>{modifier}</Text>
        </Box>
      </Card>
    </Box>
  );
};

export default HandCard;
