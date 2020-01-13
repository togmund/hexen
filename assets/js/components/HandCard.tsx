import * as React from 'react';
import classNames from 'classnames';
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
  const handClass: any = classNames('hand-card', suit, 'pxl-border');

  return (
    <Box
      className={handClass}
      onClick={selectCard}
      sx={{
        p: 1,
        borderRadius: 10,
        boxShadow: '0 0 16px rgba(0, 0, 0, .25)'
      }}
    >
      <Card>
        <Text className={'card-title'}>{name}</Text>
        <Image src={image} />
        <Box className={'card-info'}>
          <Text className={'card-suit'}>{suit}</Text>
          <Text className={'card-modifier'}>{modifier}</Text>
          <Text className={'card-description'}>{description}</Text>
        </Box>
      </Card>
    </Box>
  );
};

export default HandCard;
