import * as React from 'react';
import classNames from 'classnames';
import '../../css/Deck.css';

const Deck = (props: { state: any }) => {
  const { state } = props;
  const deckImage: any = classNames('deck-image', 'pxl-border');
  return (
    <img
      className={deckImage}
      src={'https://i.ibb.co/0qNLgrn/7qzjt-PS-4x.png'}
      alt={'deck-image'}
      onClick={state.showCards}
      onMouseOver={state.showCount}
    />
  );
};

export default Deck;
