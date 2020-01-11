import * as React from 'react';
import '../../css/Navbar.css';

const Navbar = () => {
  const CARDS_IN_DECK = 40;
  const ATTACK_CARDS = 15;
  const GATHER_CARDS = 10;
  const MOVE_CARDS = 15;
  const TIMER = 30;
  const PLAYERS = 4;

  return (
    <nav className={'navbar'}>
      <img
        src="https://s.put.re/cH2D7Qq6.png"
        alt="deck-icon"
        height="40"
        width="30"
        className={'deck-icon'}
      ></img>
      <p className={'cards-remaining'}>{CARDS_IN_DECK}</p>
      <p className={'attack-cards-remaining'}>{ATTACK_CARDS}</p>
      <p className={'gather-cards-remaining'}>{GATHER_CARDS}</p>
      <p className={'move-cards-remaining'}>{MOVE_CARDS}</p>
      <p className={'turn-timer'}>{TIMER}</p>
      <p className={'num-players'}>{PLAYERS}</p>
    </nav>
  );
};

export default Navbar;
