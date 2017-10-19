// Copyright (c) 2017, aitor. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:nuberu/nuberu.dart';
import 'package:nuberu/nuberu.mysql.dart';
import 'user.dart';

main() async {
  var connector = new MysqlConnector("galert", "galert", "galertpass");
  var repository = await connector.connect();
  print("conectado");
  connector.disconnect();
  print("desconectado");
}
