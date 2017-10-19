import 'dart:async';
import 'package:nuberu/src/mysql/connector.dart';
import 'package:nuberu/nuberu.dart';

class MysqlRepository implements Repository {
  MysqlConnector _connection;

  MysqlRepository(MysqlConnector conn) {
    this._connection = conn;
  }

  Future<E> findOne<E>([Filter filter]) {

  }

  Future<List<E>> findAll<E>([Filter filter]) {}

  Future<int> count<E>([Filter filter]) {}

  Future persist<E>(E model) {}

  Future delete<E>(E model) {}

  Future refresh<E>(E model) {}

  Future<bool> exists<E>(E model) {}

  Future clear([String name]) {}

  Future<E> copy<E>(E model) {}

  Repository transaction() {}

  Future flush() {}

  Future<bool> isConnected() async {
    try {
      await this._connection.SqlConnection.ping();
      return true;
    }
    catch (e) {
      return false;
    }
  }

  /// Close the connection associated to this manager.
  Future close() async {
    return await this._connection.disconnect();
  }
}