// Copyright (c) 2017, aitor. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:nuberu/nuberu.dart';
import 'package:nuberu/nuberu.mysql.dart';
import 'user.dart';

main() {
  var connect = new Nuberu(new NuberuMysql("test", "testuser", "testpass"));

  var awesome = new UserModel();
  awesame.name = "Manolo";
  awesome.save(connect);
}
