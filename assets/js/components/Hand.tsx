import * as React from 'react';
import '../../css/Card.css';
import HandCard from './HandCard';
import { Tiles } from '@rebass/layout';

const Hand = () => {
  const handCards = [
    {
      id: 1,
      name: 'Long Haul Boots',
      suit: 'Move',
      description: 'Travel two hexes instead of one.',
      image: 'http://pixelartmaker.com/art/920bb2ea34df485.png',
      modifier: 2
    },
    {
      id: 2,
      name: 'Pickaxe',
      suit: 'Gather',
      description: 'Triple haul on ore resources.',
      image: 'http://pixelartmaker.com/art/16c8f43e143cb6d.png',
      modifier: 3
    },
    {
      id: 3,
      name: 'Anvil',
      suit: 'Craft',
      description: 'Extra bonus on crafted weapons.',
      image: 'http://pixelartmaker.com/art/9cf72f5b79c4946.png',
      modifier: 3
    }
  ];

  const onChange = (id: number | null) => {
    value = id;
    console.log(value);
  };

  return (
    <Tiles width={[96, null, 128]} className="card-container">
      {handCards.map(card => (
        <HandCard
          key={card.id}
          image={card.image}
          suit={card.suit}
          name={card.name}
          description={card.description}
          modifier={card.modifier}
          selected={card.id === value}
          selectCard={() => onChange(card.id)}
        />
      ))}
    </Tiles>
  );
};
export let value: number | null = null;
export default Hand;
