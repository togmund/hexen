import { useReducer, useEffect, useCallback, useRef } from 'react';
import socket from '../socket';

import reducer, {
  SET_INITIAL,
  SET_CHANNEL,
  SET_BOARD,
  NEW_HEX,
  SET_HEX,
  SET_HAND,
  SET_QUESTS,
  DECK_CARD_SELECTED,
  HEX_SELECTED,
  CLEAR_REWARD,
  USER_SELECTED,
  REWARD
  // SET_BAND
} from '../reducers/application';

export default function useHexData(player) {
  const [state, dispatch] = useReducer(reducer, {
    player: { id: player.id },
    hex_tiles: [],
    tile: { id: player.hex_id },
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
    deck_card_suit: null,
    target_hex: null,
    target_user: null,
    channel: socket.channel(`hex:${player.hex_id}`, {}),
    quest_hexes: []
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
        console.log('RESPONSE', response);
        dispatch({ type: SET_INITIAL, data: response.data });
      });
  };

  // Join the Channel
  useEffect(() => {
    getInitialBoardFromUser(state.player.id);
    init(socket, state.tile.id);
  }, [state.tile.id]);

  const init = (socket, tile_id) => {
    const new_channel = socket.channel(`hex:${tile_id}`, {});
    // Join the Channel
    new_channel
      .join()
      .receive('ok', (resp: any) => {
        console.log('Joined successfully', resp);
        dispatch({ type: SET_CHANNEL, channel: new_channel });
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
  });

  // Update the hex on the hex_state broadcast
  useEffect(() => {
    state.channel.on('SET_HEX', (msg: any) => {
      dispatch({ type: SET_HEX, tile: msg.tile });
    });
    return () => {
      state.channel.off('SET_HEX');
    };
  });

  // Update the hand on the new_hand broadcast
  useEffect(() => {
    state.channel.on('SET_HAND', (msg: any) => {
      dispatch({
        type: SET_HAND,
        hand: msg.players[state.player.id].hand,
        player: msg.players[state.player.id]
      });
    });
    return () => {
      state.channel.off('SET_HAND');
    };
  });

  // Broadcast the selected card on the select_card broadcast
  useEffect(() => {
    state.channel.on('GET_CARD', (msg: {}) => {
      dispatch({ type: CLEAR_REWARD });
      respondWithCard(state);
    });
    return () => {
      state.channel.off('GET_CARD');
    };
  }, [state.channel, state.selected_card]);

  useEffect(() => {
    state.channel.on('SET_QUESTS', (msg: any) => {
      if (msg.players[state.player.id]) {
        dispatch({
          type: SET_QUESTS,
          quests: msg.players[state.player.id].active_quest_hexes
        });
      }
    });
    return () => {
      state.channel.off('SET_QUESTS');
    };
  });

  const respondWithCard = state => {
    state.channel.push('selected_card', {
      deck_card_id: state.selected_card,
      room_name: `hex:${state.tile.id}`,
      tile_id: state.tile.id,
      user_id: state.player.id,
      target_hex_id: state.target_hex,
      target_user_id: state.target_user
    });

    if (state.selected_card && state.deck_card_suit) {
      console.log('SELECTED:', state.selected_card);
      console.log('SUIT:', state.deck_card_suit);

      console.log('TARGET: ', state.target_hex);
      if (state.deck_card_suit === 'Gather') {
        console.log(state);
        dispatch({
          type: REWARD,
          reward: {
            name: 'Elixir',
            suit: 'Craft',
            description: 'Concoct an elixir.',
            image: 'https://i.ibb.co/cQMbv3Q/4g7-ITMF-8x.png',
            modifier: 2,
            material: state.tile.resource
          }
        });
      }

      if (state.target_hex && state.deck_card_suit === 'Move') {
        console.log('move');
        dispatch({ type: NEW_HEX, tile: state.target_hex });
      }

      if (state.target_user) {
        if (state.deck_card_suit === 'Combat') {
          dispatch({
            type: REWARD,
            reward: {
              name: 'Map',
              suit: 'Explore',
              description: 'See nearby quest markers.',
              image: 'https://i.ibb.co/ngC8G2d/Lde-Txc2-8x.png',
              modifier: 1
            }
          });
        }
        if (state.deck_card_suit === 'Interact') {
          dispatch({
            type: REWARD,
            reward: {
              name: 'Map',
              suit: 'Explore',
              description: 'See nearby quest markers.',
              image: 'https://i.ibb.co/ngC8G2d/Lde-Txc2-8x.png',
              modifier: 1
            }
          });
        }
      }

      if (state.deck_card_suit === 'Craft') {
        dispatch({
          type: REWARD,
          reward: {
            name: 'Sword',
            suit: 'Combat',
            description: 'Deals three physical damage',
            image: 'https://i.ibb.co/xspKdvw/c4oui-Ug-8x.png',
            modifier: 3
          }
        });
      }
    }
  };

  const stateObject = {
    state: state,

    selectCard: function selectCard(selected_card, suit) {
      dispatch({
        type: DECK_CARD_SELECTED,
        deck_card: selected_card,
        deck_card_suit: suit
      });
    },

    targetHex: function targetHex(selected_hex) {
      dispatch({ type: HEX_SELECTED, target_hex: selected_hex });
    },

    targetUser: function targetUser(selected_user) {
      dispatch({ type: USER_SELECTED, target_user: selected_user });
    },

    clearReward: function clearReward() {
      dispatch({ type: CLEAR_REWARD });
    }
  };

  return stateObject;
}
