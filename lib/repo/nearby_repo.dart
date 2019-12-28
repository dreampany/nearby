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

  NearbyRepo._internal();

  factory NearbyRepo.of() {
    if (instance == null) instance = NearbyRepo._internal();
    return instance;
  }

  void advertise(Peer peer) async {
    final String serviceId = await Constants.Api.getAppId();
    Constants.logger.d("NEARBY Service ID " + serviceId);
    await Nearby().startAdvertising(peer.name, Strategy.P2P_CLUSTER,
        serviceId: serviceId,
        onConnectionInitiated: (endpointId, connectionInfo) =>
            connectionInitiated(endpointId, connectionInfo),
        onConnectionResult: null,
        onDisconnected: null);
  }

  void connectionInitiated(
      String endpointId, ConnectionInfo connectionInfo) async {

  }
}
