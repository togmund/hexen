import socket from '../socket';

export default function socketHandler() {
  // Render the map on the render_map broadcast

  // channel.on('SET_BOARD', (msg: any) => {
  //   // dispatch({ type: SET_BOARD, hex_tiles: msg.hex_tiles });
  //   msg.hex_tiles;
  // });

  // // Update the hex on the hex_state broadcast

  // channel.on('SET_HEX', (msg: any) => {
  //   // dispatch({ type: SET_HEX, tile: msg.tile[0] });
  //   tile: msg.tile[0];
  // });

  // // Update the hand on the new_hand broadcast

  // channel.on('SET_HAND', (msg: any) => {
  //   // dispatch({ type: SET_HAND, hand: msg.players[0].hand });
  //   msg.players[0].hand;
  // });

  // // Broadcast the selected card on the select_card broadcast
  // channel.on('GET_CARD', (msg: {}) => {
  //   respondWithCard(channel, state);
  // });

  const socketObject = {
    channel: socket.channel(`hex:60`, {}),

    init: function init(hex_id) {
      this.channel = socket.channel(`hex:${hex_id}`, {});
      this.channel
        .join()
        .receive('ok', (resp: any) => {
          console.log('Joined successfully', resp);
        })
        .receive('error', (resp: any) => {
          console.log('Unable to join', resp);
        });
    },

    respondToTurnEnd: function respondToTurnEnd(playerState) {
      this.channel
        .push('selected_card', {
          deck_card_id: playerState.selected_card,
          room_name: `hex:${playerState.tile.id}`,
          user_id: playerState.player,
          target_hex_id: playerState.target_hex,
          target_user_id: playerState.target_user
        })
        .receive('ok', (resp: any) => {
          console.log('Card selected successfully', resp);
          // dispatch({ type: ACTION_RESOLVED });
        });
    }
  };

  return socketObject;
}
