import 'dart:async';
import 'package:logging/logging.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:nuberu/nuberu.dart';

class MysqlConnector implements Database {
  final Logger log = new Logger("MysqlConnector");
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

  @override
  Future connect() async {
    // TODO: implement flush
  }

  @override
  Future disconnect() async {
    return this._connection.closeConnectionsNow();
  }

  @override
  Future flush() {
    // TODO: implement flush
  }

  @override
  Repository getRepo(String name) {
    // TODO: implement getRepo
  }

  @override
  Future<bool> isConnected() {
    // TODO: implement isConnected
  }

  @override
  setModel(String name, Type type) {
    // TODO: implement setModel
  }

  @override
  setModels(Map<String, Type> models) {
    // TODO: implement setModels
  }
}
