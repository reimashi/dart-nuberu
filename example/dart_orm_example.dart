// Copyright (c) 2017, aitor. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:logging/logging.dart';
import 'package:nuberu/nuberu.mysql.dart';
import 'feed.dart';

main() async {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  /*MysqlConnector conn = new MysqlConnector("galert", "galert", "galertpass");
  MysqlRepository repo = await conn.connect();

  Feed feed = await repo.findOne(Feed);
  print(feed.url);

  List<Feed> feeds = await repo.findAll()
                              ..where();*/
}
