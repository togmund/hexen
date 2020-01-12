import * as React from 'react';
import '../../css/Deck.css';

const Deck = (props: { state: any }) => {
  const { state } = props;
  return (
    <img
      className="deck-image"
      // src={state.image}
      src="https://i.ibb.co/Y0jRtdK/DMsxml-Y-15x.png"
      alt="deck-image"
      onClick={state.showCards}
      onMouseOver={state.showCount}
    />
  );
};

export default Deck;
