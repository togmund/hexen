const HexChannel = {
  init(socket, hexID) {
    const room = hexID; // Hex ID or Name
    const channel = socket.channel('hex:' + room, {});
    channel
      .join()
      .receive('ok', resp => {
        console.log('Joined successfully', resp);
      })
      .receive('error', resp => {
        console.log('Unable to join', resp);
      });

    channel.on('hex_state', msg => {
      console.log('The hex state is: ', msg);
    });
  }
};

export default HexChannel;
