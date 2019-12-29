import * as React from 'react';

const Deck = ({ children }: { children: any }) => {
  const image = '...';

  // Display the remaining cards in the deck
  function showCards() {
    // TO DO
  }

  // Display how many cards remain in the deck
  function showCount() {
    // TO DO
  }

  return (
    <img
      className="deck"
      src={image}
      alt="deck-image"
      onClick={showCards}
      onMouseOver={showCount}
    ></img>
  );
};

export default Deck;
