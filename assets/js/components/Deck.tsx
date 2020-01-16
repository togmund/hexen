import * as React from 'react';
import classNames from 'classnames';
import '../../css/Deck.css';

const Deck = (props: { state: any }) => {
  const { state } = props;
  const deckImage: any = classNames('deck-image', 'pxl-border');
  return (
    <div className={'flip-card pxl-border'} onClick={() => {}}>
      <div className={'flip-card-inner'}>
        <div className={'flip-card-front'}>
          <img
            src={'https://i.ibb.co/0qNLgrn/7qzjt-PS-4x.png'}
            alt={'Avatar'}
          ></img>
        </div>
        <div className={'flip-card-back'}>
          <h1>New</h1>
          <h1>Card</h1>
        </div>
      </div>
    </div>
    // <img
    //   className={deckImage}
    //   // src={state.image}
    //   src={'https://i.ibb.co/0qNLgrn/7qzjt-PS-4x.png'}
    //   alt={'deck-image'}
    //   onClick={state.showCards}
    //   onMouseOver={state.showCount}
    // />
  );
};

export default Deck;
