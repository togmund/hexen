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
    target_user: null
  });

  const getState = useCallback(() => {
    console.log(stateObject.state);
    return state;
  }, [state]);

  // const useEffectSafe = (callback, deps) => {
  //   const callbackRef = useRef(callback);
  //   useEffect(() => {
  //     callbackRef.current = callback;
  //   });
  //   useEffect(() => {
  //     callbackRef.current!();
  //   }, deps);
  // };
  useEffect(() => {
    getInitialBoardFromUser(state.player);
    init(socket, state.tile.id, getState);
  }, [state.tile.id]);

  // useEffect(() => {}, [state]);

  const getInitialBoardFromUser = (id: any) => {
    fetch(`api/map/${id}`)
      .then(response => {
        return response.json();
      })
      .then(response => {
        dispatch({ type: SET_INITIAL, data: response.data });
      });
  };

  const init = (
    socket: { channel: (arg0: string, arg1: {}) => any },
    hexID: any,
    getState
  ) => {
    // Establish the Channel
    const room = hexID;
    const channel = socket.channel('hex:' + room, {});

    // Join the Channel
    channel
      .join()
      .receive('ok', (resp: any) => {
        console.log('Joined successfully', resp);
      })
      .receive('error', (resp: any) => {
        console.log('Unable to join', resp);
      });

    // Render the map on the render_map broadcast
    channel.on('SET_BOARD', (msg: any) => {
      dispatch({ type: SET_BOARD, hex_tiles: msg.hex_tiles });
    });

    // Update the hex on the hex_state broadcast
    channel.on('SET_HEX', (msg: any) => {
      dispatch({ type: SET_HEX, tile: msg.tile[0] });
    });

    // Update the hand on the new_hand broadcast
    channel.on('SET_HAND', (msg: any) => {
      dispatch({ type: SET_HAND, hand: msg.players[0].hand });
    });

    // Broadcast the selected card on the select_card broadcast
    channel.on('GET_CARD', (msg: {}) => {
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
        })
        .receive('error', (resp: any) => {
          console.log('Card not', resp);
        });
    });

    return () => {
      channel.leave();
    };
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
