import { useReducer, useEffect } from 'react';

import reducer, {
  SET_BOARD
  // SET_HEX,
  // SET_HAND,
  // SET_BAND
} from '../reducers/application';

export default function useApplicationData() {
  const [state, dispatch] = useReducer(reducer, {
    hex_tiles: []
    // hand: [],
    // band: {}
  });

  // const refreshState = () => {
  //   dispatch({
  //   });
  // };

  // useEffect(() => {
  //   refreshState();
  // }, []);

  const stateObject = {
    state: state,

    updateBoard: function updateBoard(msg) {
      dispatch({ type: SET_BOARD, hex_tiles: msg.hex_tiles });
    }

    // updateHand: function updateHand() {
    //   dispatch({
    //   });
    // },
    // updateHex: function updateHex() {
    //   dispatch({
    //   });
    // }
    // updateBand: function updateBand() {
    //   dispatch({
    //   });
    // }
  };
  return stateObject;
}
