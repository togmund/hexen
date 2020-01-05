import * as React from 'react';
import { Box, Card, Image, Heading, Text } from 'rebass';

const HandCard = ({ image, suit, name, description, modifier }) => {
  function performAction(actionSuit: 'Attack' | 'Gather' | 'Move') {
    // TO DO
  }

  return (
    <Box width={1 / 3}>
      <Card
        sx={{
          p: 1,
          borderRadius: 2,
          boxShadow: '0 0 16px rgba(0, 0, 0, .25)'
        }}
      >
        <Image src={image} />
        <Box px={2}>
          <Heading as="h3">{name}</Heading>
          <Heading as="h3">{suit}</Heading>
          <Text fontSize={0}>{description}</Text>
          <Text fontSize={0}>{modifier}</Text>
        </Box>
      </Card>
    </Box>
  );
};

export default Card;
