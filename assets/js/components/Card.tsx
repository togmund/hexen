import * as React from 'react';
import '../../css/Card.css';

const Card = () => {
  const title = 'Halberd';
  const imageUrl = '...';
  const type = 'Attack';
  const range = 1;
  const description =
    'Two-handed pole weapon. It hews, it slices, it stabs, it bludgeons, it’s got fantastic anti-armor properties, strong parries, creates large wounds, has enormous reach, and is still short enough that you can use it like a staff in close. Deals 3 damage to enemies.';

  return (
    <article className={'card'}>
      <p className={'card-title'}>{title}</p>
      <img src={imageUrl} alt="card-image"></img>
      <p className={'card-type'}>{type}</p>
      <p className={'card-range'}>{range}</p>
      <p className={'card-description'}>{description}</p>
    </article>
  );
};

export default Card;
