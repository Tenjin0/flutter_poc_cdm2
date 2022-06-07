import 'package:cdm_mobile2/controllers/informations.dart';
import 'package:get/get.dart';
import 'package:cdm_mobile2/controllers/cdm_url.dart';
import 'package:cdm_mobile2/controllers/informations.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

socketFactory(String ip) {
  final InformationsCtrl globalInfo = Get.find<InformationsCtrl>();

  IO.Socket socket = IO.io(
      ip,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .disableReconnection()
          .build());

  socket.on('central.init', (data) {
    socket.emit("central.init", {
      "id": globalInfo.info.value.id,
      "name": globalInfo.info.value.name,
      "version": globalInfo.info.value.version,
    });
  });
  socket.on('infos', (data) {
    socket.emit('infos', {
      "hardwareserial": globalInfo.info.value.id,
      "version": globalInfo.info.value.version
    });
  });
  socket.on('central.init.ack', (id) {
    globalInfo.register(id);
  });

  return socket;
}
