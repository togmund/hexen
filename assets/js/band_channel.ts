const BandChannel = {
  init(socket) {
    const room = '';
    const channel = socket.channel('band:' + room, {});
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

export default BandChannel;
