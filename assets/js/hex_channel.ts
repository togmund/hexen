import { value } from './components/Hand';

const HexChannel = {
  state: {},
  world_map: [],
  init(socket: { channel: (arg0: string, arg1: {}) => any }, hexID: any) {
    const room = hexID; // Hex ID or Name
    const channel = socket.channel('hex:' + room, {});
    channel
      .join()
      .receive('ok', (resp: any) => {
        console.log('Joined successfully', resp);
      })
      .receive('error', (resp: any) => {
        console.log('Unable to join', resp);
      });

    channel.on('render_map', (msg: {}) => {
      this.world_map = msg;
      channel
        .push('render_map', this.world_map)
        .receive('ok', (resp: any) => {
          console.log('Hexes passed to frontend', resp);
        })
        .receive('error', (resp: any) => {
          console.log('Couldn"t pass hexes to frontend', resp);
        });
    });

    channel.on('hex_state', (msg: {}) => {
      this.state = msg;
      console.log(this.state);
    });

    channel.on('select_card', (msg: {}) => {
      channel
        .push('selected_card', {
          deck_card_id: value,
          room_name: `hex:${room}`
        })
        .receive('ok', (resp: any) => {
          console.log('Card selected successfully', resp);
        })
        .receive('error', (resp: any) => {
          console.log('Card not', resp);
        });
    });
  }
};

export default HexChannel;
