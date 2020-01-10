import * as React from 'react';
import '../../css/Card.css';
import HandCard from './HandCard';
import { Tiles } from '@rebass/layout';
import useHexData from '../hooks/useHexData';

const Hand = () => {
  const { state } = useHexData();

  const onChange = (id: number | null) => {
    value = id;
    console.log(value);
  };

  return (
    <Tiles width={[96, null, 128]} className="card-container">
      {state.hand.map(card => (
        <HandCard
          key={card.card_details.id}
          image={card.card_details.image}
          suit={card.card_details.suit}
          name={card.card_details.name}
          description={card.card_details.description}
          modifier={card.card_details.modifier}
          selected={card.card_details.id === value}
          selectCard={() => onChange(card.card_details.id)}
        />
      ))}
    </Tiles>
  );
};
export let value: number | null = null;
export default Hand;
