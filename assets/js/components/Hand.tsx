import * as React from 'react';
import '../../css/Card.css';
import HandCard from './HandCard';

const Hand = ({ handCards }) => {
  return (
    <section>
      {handCards.map(card => (
        <HandCard
          key={card.id}
          image={card.image}
          suit={card.suit}
          name={card.name}
          description={card.description}
          modifier={card.modifier}
        />
      ))}
    </section>
  );
};

export default Hand;
