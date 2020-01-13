import { useReducer, useEffect, useCallback, useRef } from 'react';
import socket from '../socket';

import reducer, {
  SET_INITIAL,
  SET_CHANNEL,
  SET_BOARD,
  SET_HEX,
  SET_HAND,
  DECK_CARD_SELECTED,
  HEX_SELECTED,
  USER_SELECTED
  // SET_BAND
} from '../reducers/application';

export default function useHexData() {
  const [state, dispatch] = useReducer(reducer, {
    player: 1,
    hex_tiles: [],
    tile: { id: 50 },
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
    channel: socket.channel('hex:' + 60, {})
  });

  const getState = () => {
    return stateObject;
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

  // Join the Channel
  useEffect(() => {
    getInitialBoardFromUser(state.player);
    init(socket, state.tile.id);
  }, [state.tile.id]);

  const init = (socket, tile_id) => {
    const channel = socket.channel('hex:' + tile_id, {});
    // Join the Channel
    channel
      .join()
      .receive('ok', (resp: any) => {
        console.log('Joined successfully', resp);
        dispatch({ type: SET_CHANNEL, channel: channel });
      })
      .receive('error', (resp: any) => {
        console.log('Unable to join', resp);
      });
  };

  // Render the map on the render_map broadcast
  useEffect(() => {
    state.channel.on('SET_BOARD', (msg: any) => {
      dispatch({ type: SET_BOARD, hex_tiles: msg.hex_tiles });
    });
    return () => {
      state.channel.off('SET_BOARD');
    };
  }, [state]);

  // Update the hex on the hex_state broadcast
  useEffect(() => {
    state.channel.on('SET_HEX', (msg: any) => {
      dispatch({ type: SET_HEX, tile: msg.tile[0] });
    });
    return () => {
      state.channel.off('SET_HEX');
    };
  }, [state]);

  // Update the hand on the new_hand broadcast
  useEffect(() => {
    state.channel.on('SET_HAND', (msg: any) => {
      dispatch({ type: SET_HAND, hand: msg.players[0].hand });
    });
    return () => {
      state.channel.off('SET_HAND');
    };
  }, [state]);

  // Broadcast the selected card on the select_card broadcast
  useEffect(() => {
    state.channel.on('GET_CARD', (msg: {}) => {
      console.log('get card', state);
      respondWithCard(state);
    });
    return () => {
      state.channel.off('GET_CARD');
    };
  }, [state]);

  const respondWithCard = state => {
    console.log('respond with card', state);
    state.channel
      .push('selected_card', {
        deck_card_id: state.selected_card,
        room_name: `hex:${state.tile.id}`,
        user_id: state.player,
        target_hex_id: state.target_hex,
        target_user_id: state.target_user
      })
      .receive('ok', (resp: any) => {
        console.log('Card selected successfully', resp);
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
