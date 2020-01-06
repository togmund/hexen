import { value } from './components/Hand';

const HexChannel = {
  state: {},
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

    channel.on('hex_state', (msg: {}) => {
      this.state = msg;
      channel.push('selected_card', value);
      console.log(this.state);
    });
  }
};

export default HexChannel;
