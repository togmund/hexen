import * as React from 'react';
import HandCard from './HandCard';

import '../../css/Hand.css';

const Hand = (props: { state: any }) => {
  const { state, clearReward } = props;

  return state.reward ? (
    <div className={'flip-card pxl-border'} onClick={() => clearReward()}>
      <div className={'flip-card-inner'}>
        <div className={'flip-card-front'}>
          <h1>New</h1>
          <h1>Card</h1>
        </div>
        <div className={'flip-card-back'}>
          <HandCard
            image={state.reward.image}
            suit={state.reward.suit}
            name={state.reward.name}
            description={state.reward.description}
            modifier={state.reward.modifier}
            selected={false}
            selectCard={() => clearReward()}
          />
        </div>
      </div>
    </div>
  ) : (
    <></>
  );
};

export default Hand;
