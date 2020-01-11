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
      <img src={require('../../images/hexagon-new.png').default}></img>
      <span className={'game-info'}>
        <span>{CARDS_IN_DECK}</span>
        <span>{ATTACK_CARDS}</span>
        <span>{GATHER_CARDS}</span>
        <span>{MOVE_CARDS}</span>
        <span>{TIMER}</span>
        <span>{PLAYERS}</span>
      </span>
    </nav>
  );
};

export default Navbar;
