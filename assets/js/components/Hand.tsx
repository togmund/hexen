import * as React from 'react';
import HandCard from './HandCard';
import { Tiles } from '@rebass/layout';
import { TransitionGroup, CSSTransition } from 'react-transition-group';

import '../../css/Hand.css';

const Hand = (props: { state: any }) => {
  const { state, selectCard } = props;

  return (
    <TransitionGroup>
      <Tiles columns={[2, null, 3]} className="card-container">
        {state.hand ? (
          state.hand.map(card => (
            <CSSTransition
              key={card.deck_card_id * 1000000}
              timeout={500}
              classNames="alert"
            >
              <HandCard
                key={card.deck_card_id}
                image={card.card_details.image}
                suit={card.card_details.suit}
                name={card.card_details.name}
                description={card.card_details.description}
                modifier={card.card_details.modifier}
                selected={card.deck_card_id === state.selected_card}
                selectCard={() =>
                  selectCard(card.deck_card_id, card.card_details.suit)
                }
              />
            </CSSTransition>
          ))
        ) : (
          <div />
        )}
      </Tiles>
    </TransitionGroup>
  );
};

export default Hand;
