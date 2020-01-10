import { useReducer, useEffect } from 'react';
import socket from '../socket';

import reducer, {
  SET_BOARD,
  SET_HEX,
  SET_HAND
  // SET_BAND
} from '../reducers/application';

import { value } from '../components/Hand';

export default function useHexData() {
  const [state, dispatch] = useReducer(reducer, {
    hex_tiles: [],
    tile: { id: 1 },
    hand: []
  });

  useEffect(() => {
    return init(socket, state.tile.id);
  }, []);

  const init = (socket, hexID) => {
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
      dispatch({ type: SET_HEX, tile: msg.tile[1] });
    });

    // Update the hand on the new_hand broadcast
    channel.on('SET_HAND', (msg: any) => {
      dispatch({ type: SET_HAND, hand: msg.players[0].hand });
    });

    // Broadcast the selected card on the select_card broadcast
    channel.on('GET_CARD', (msg: {}) => {
      channel
        .push('selected_card', {
          deck_card_id: value,
          room_name: `hex:${state.tile.id}`,
          user_id: 1, // TO DO
          target_hex_id: 3 // TO DO
        })
        .receive('ok', (resp: any) => {
          console.log('Card selected successfully', resp);
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
    state: state
  };
  return stateObject;
}
