import * as React from 'react';
import '../../css/Card.css';

const Card: React.FC = () => (
  <article className={'card'}>
    <p className={'card-title'}>Halberd</p>
    <img src="..." alt="card-image"></img>
    <p className={'card-type'}>Attack</p>
    <p className={'card-description'}>
      Two-handed pole weapon. It hews, it slices, it stabs, it bludgeons, it’s
      got fantastic anti-armor properties, strong parries, creates large wounds,
      has enormous reach, and is still short enough that you can use it like a
      staff in close. Deals 3 damage to enemies.aaaaaaaaaaaaaaa
    </p>
  </article>
);

export default Card;
