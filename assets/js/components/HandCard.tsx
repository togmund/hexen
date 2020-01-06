import * as React from 'react';
import { Box, Card, Image, Heading, Text } from 'rebass';

const HandCard = ({ image, suit, name, description, modifier }) => {
  function performAction(actionSuit: 'Attack' | 'Gather' | 'Move') {
    // TO DO
  }

  return (
    <Card
      sx={{
        borderRadius: 2,
        boxShadow: '0 0 16px rgba(0, 0, 0, .25)'
      }}
    >
      <Image src={image} />
      <Box>
        <Heading as="h3">{name}</Heading>
        <Heading as="h3">{suit}</Heading>
        <Text>{description}</Text>
        <Text>{modifier}</Text>
      </Box>
    </Card>
  );
};

export default HandCard;
