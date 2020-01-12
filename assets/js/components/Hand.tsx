import * as React from 'react';
import HandCard from './HandCard';
import { Tiles } from '@rebass/layout';
import '../../css/Hand.css';

const Hand = (props: { state: any }) => {
  const { state, selectCard } = props;

  const onChange = (id: number | null) => {
    value = id;
    console.log(value);
  };

  return (
    <Tiles columns={[2, null, 3]} className="card-container">
      {state.hand ? (
        state.hand.map(card => (
          <HandCard
            key={card.deck_card_id}
            image={card.card_details.image}
            suit={card.card_details.suit}
            name={card.card_details.name}
            description={card.card_details.description}
            modifier={card.card_details.modifier}
            selected={card.deck_card_id === value}
            selectCard={() => selectCard(card.deck_card_id)}
          />
        ))
      ) : (
        <div />
      )}
    </Tiles>
  );
};
export let value: number | null = null;
export default Hand;
