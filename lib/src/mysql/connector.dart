import 'dart:async';
import 'package:nuberu/src/mysql/repository.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:nuberu/nuberu.dart';

class MysqlConnector implements Connector {
  ConnectionPool _connection;

  MysqlConnector(String database, String username, String password,
      {String host: 'localhost',
      int port: 3306,
      int max: 5,
      int maxPacketSize: 16 * 1024 * 1024,
      bool useSSL: false}) {
    this._connection = new ConnectionPool(
        host: host,
        port: port,
        user: username,
        password: password,
        db: database,
        max: max,
        maxPacketSize: maxPacketSize,
        useSSL: useSSL);
  }

  ConnectionPool get SqlConnection => this._connection;

  Future<Repository> connect() async {
    await this._connection.ping();
    return new MysqlRepository(this);
  }

  Future disconnect() async {
    return this._connection.closeConnectionsNow();
  }
}
