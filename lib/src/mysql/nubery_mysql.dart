import 'dart:async';
import 'package:nuberu/nuberu.dart';

class NuberuMysql implements NuberuConnector {
  NuberuMysql(String database, String username, String password, [
    String host = "localhost",
    int port = 3306,
    // Timezone ?,
    int pool_max = 5
  ]) {

  }

  Future connect() {

  }
}