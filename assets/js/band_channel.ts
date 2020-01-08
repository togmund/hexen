const BandChannel = {
  init(socket) {
    const room = '';
    const channel = socket.channel('band:' + room, {});
    channel
      .join()
      .receive('ok', (resp: any) => {
        console.log('Joined successfully', resp);
      })
      .receive('error', (resp: any) => {
        console.log('Unable to join', resp);
      });
  }
};

export default BandChannel;
