import * as React from 'react';
import '../../css/Card.css';

const Card = () => {
  const title = 'Halberd';
  const image = '...';
  const suit = 'Attack';
  const range = 1;
  const description =
    'Two-handed pole weapon. It hews, it slices, it stabs, it bludgeons, it’s got fantastic anti-armor properties, strong parries, creates large wounds, has enormous reach, and is still short enough that you can use it like a staff in close. Deals 3 damage to enemies.';

  function performAction(actionSuit: 'Attack' | 'Gather' | 'Move') {
    // TO DO
  }

  return (
    <article className="card" onClick={performAction(suit)}>
      <p className="card-title">{title}</p>
      <img src={image} alt="card-image"></img>
      <p className="card-suit">{suit}</p>
      <p className="card-range">{range}</p>
      <p className="card-description">{description}</p>
    </article>
  );
};

export default Card;
