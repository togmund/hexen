import { useReducer, useEffect, useCallback, useRef } from 'react';
import socket from '../socket';

import reducer, {
  SET_INITIAL,
  SET_BOARD,
  SET_HEX,
  SET_HAND,
  ACTION_RESOLVED,
  DECK_CARD_SELECTED,
  HEX_SELECTED,
  USER_SELECTED
  // SET_BAND
} from '../reducers/application';

export default function useHexData() {
  const [state, dispatch] = useReducer(reducer, {
    player: 1,
    hex_tiles: [],
    tile: { id: 60 },
    hand: [
      {
        deck_card_id: null,
        card_details: {
          description: 'Take a moment, catch your breath.',
          id: 1,
          image: 'https://i.ibb.co/JmRTqB0/Zk-D80aw-8x.png',
          modifier: null,
          name: 'Rest',
          suit: 'Rest'
        }
      }
    ],
    selected_card: null,
    target_hex: 60,
    target_user: null,
    channel: null
  });

  const getState = () => {
    return state;
  };

  const getInitialBoardFromUser = (id: any) => {
    fetch(`api/map/${id}`)
      .then(response => {
        return response.json();
      })
      .then(response => {
        dispatch({ type: SET_INITIAL, data: response.data });
      });
  };

  const channel = socket.channel('hex:' + state.tile.id, {});

  // Join the Channel
  useEffect(() => {
    getInitialBoardFromUser(state.player);
    init();
  }, [state.tile.id]);

  const init = () => {
    // Join the Channel
    channel
      .join()
      .receive('ok', (resp: any) => {
        console.log('Joined successfully', resp);
      })
      .receive('error', (resp: any) => {
        console.log('Unable to join', resp);
      });

    return () => {
      channel.leave();
    };
  };

  // Render the map on the render_map broadcast
  useEffect(() => {
    channel.on('SET_BOARD', (msg: any) => {
      dispatch({ type: SET_BOARD, hex_tiles: msg.hex_tiles });
    });
    return () => {
      channel.off('SET_BOARD');
    };
  }, []);

  // Update the hex on the hex_state broadcast
  useEffect(() => {
    channel.on('SET_HEX', (msg: any) => {
      dispatch({ type: SET_HEX, tile: msg.tile[0] });
    });
    return () => {
      channel.off('SET_HEX');
    };
  }, []);

  // Update the hand on the new_hand broadcast
  useEffect(() => {
    channel.on('SET_HAND', (msg: any) => {
      dispatch({ type: SET_HAND, hand: msg.players[0].hand });
    });
    return () => {
      socket.off('SET_HAND');
    };
  }, []);

  // Broadcast the selected card on the select_card broadcast
  useEffect(() => {
    channel.on('GET_CARD', (msg: {}) => {
      console.log('get card', getState());
      respondWithCard();
    });
    return () => {
      channel.off('GET_CARD');
    };
  }, []);

  const respondWithCard = () => {
    channel
      .push('selected_card', {
        deck_card_id: getState().selected_card,
        room_name: `hex:${getState().tile.id}`,
        user_id: getState().player,
        target_hex_id: getState().target_hex,
        target_user_id: getState().target_user
      })
      .receive('ok', (resp: any) => {
        console.log('Card selected successfully', resp);
        dispatch({ type: ACTION_RESOLVED });
      });
  };

  const stateObject = {
    state: state,

    selectCard: function selectCard(selected_card) {
      console.log(`Selected Card: ${selected_card}`);
      dispatch({ type: DECK_CARD_SELECTED, deck_card: selected_card });
      console.log(state);
    },

    targetHex: function targetHex(selected_hex) {
      console.log(`Selected Hex: ${selected_hex}`);
      dispatch({ type: HEX_SELECTED, target_hex: selected_hex });
    },

    targetUser: function targetUser(selected_user) {
      console.log(`Selected user: ${selected_user}`);
      dispatch({ type: USER_SELECTED, target_user: selected_user });
    }
  };

  return stateObject;
}
