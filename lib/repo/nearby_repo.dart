import 'package:nearby/model/peer.dart';
import 'package:nearby_connections/nearby_connections.dart';

import 'package:nearby/misc/constants.dart' as Constants;

/**
 * Created by roman on 2019-12-27
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class NearbyRepo {
  static NearbyRepo instance;
  void Function(Peer peer) peerCallback;
  List<Peer> peers;

  factory NearbyRepo.of() {
    if (instance == null) instance = NearbyRepo._();
    return instance;
  }

  NearbyRepo._() {
    peers = List();
  }

  void advertise(Peer peer) async {
    final String serviceId = await Constants.Api.getAppId();
    Constants.logger.d("NEARBY Service ID " + serviceId);
    await Nearby().startAdvertising(peer.name, Strategy.P2P_CLUSTER,
        serviceId: serviceId,
        onConnectionInitiated: connectionInitiated,
        onConnectionResult: null,
        onDisconnected: null);
  }

  void discover(Peer peer) async {
    await Nearby().startDiscovery(peer.name, Strategy.P2P_CLUSTER,
        onEndpointFound: (endpointId, endpointName, serviceId) =>
            endpointFound(peer, endpointId, endpointName, serviceId),
        onEndpointLost: null);
  }

  void connectionInitiated(
      String endpointId, ConnectionInfo connectionInfo) async {
    await Nearby()
        .acceptConnection(endpointId, onPayLoadRecieved: payloadRecieved);
  }

  void endpointFound(Peer peer, String endpointId, String endpointName,
      String serviceId) async {
    await Nearby().requestConnection(peer.name, endpointId,
        onConnectionInitiated: connectionInitiated,
        onConnectionResult: null,
        onDisconnected: null);
  }

  void payloadRecieved(String endpointId, Payload payload) {
    List<String> data =
        String.fromCharCodes(payload.bytes).split(Constants.Sep.COMMA);
    Constants.logger.d("NEARBY " + data.first);

    switch (data[0]) {
    }
  }
}
