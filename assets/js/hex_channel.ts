const HexChannel = {
  init(socket) {
    const room = 'tile'; // Hex ID or Name
    const channel = socket.channel('hex:' + room, {});
    channel
      .join()
      .receive('ok', resp => {
        console.log('Joined successfully', resp);
      })
      .receive('error', resp => {
        console.log('Unable to join', resp);
      });
  }
};

export default HexChannel;
