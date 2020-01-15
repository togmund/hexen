import * as React from 'react';
import HandCard from './HandCard';
import { Tiles } from '@rebass/layout';
import { CSSTransition } from 'react-transition-group';

import '../../css/Hand.css';

const Hand = (props: { state: any }) => {
  const { state, selectCard } = props;

  return (
    <Tiles columns={[2, null, 3]} className="card-container">
      {state.hand ? (
        state.hand.map(card => (
          <CSSTransition
            key={card.deck_card_id * 40000}
            transitionAppear={true}
            transitionAppearTimeout={3000}
            transitionEnter={true}
            transitionLeave={true}
          >
            <HandCard
              key={card.deck_card_id}
              image={card.card_details.image}
              suit={card.card_details.suit}
              name={card.card_details.name}
              description={card.card_details.description}
              modifier={card.card_details.modifier}
              selected={
                card.deck_card_id === state.selected_card &&
                card.card_details.suit !== 'Rest'
              }
              selectCard={() => selectCard(card.deck_card_id)}
            />
          </CSSTransition>
        ))
      ) : (
        <div />
      )}
    </Tiles>
  );
};

export default Hand;
