import { Presence } from 'phoenix';
import { value } from './components/Hand';

const HexChannel = {
  state: {},
  init(socket: { channel: (arg0: string, arg1: {}) => any }, hexID: any) {
    const room = hexID; // Hex ID or Name
    const channel = socket.channel('hex:' + room, {});
    const presence = new Presence(channel);
    channel
      .join()
      .receive('ok', (resp: any) => {
        console.log('Joined successfully', resp);
      })
      .receive('error', (resp: any) => {
        console.log('Unable to join', resp);
      });

    channel.on('hex_state', (msg: {}) => {
      this.state = msg;
      channel.push('selected_card', value);
      console.log(this.state);
    });
  },
  leave(socket: { channel: (arg0: string, arg1: {}) => any }, hexID: any) {
    const room = hexID;
    const channel = socket.channel('hex:' + room, {});
    channel.leave().receive('ok', (resp: any) => {
      console.log('Success', resp);
    });
  }
};

export default HexChannel;
