import 'dart:async';
import 'package:sqljocky5/sqljocky.dart';
import 'package:nuberu/src/mysql/connector.dart';
import 'package:nuberu/nuberu.dart';

import 'dart:mirrors';

class MysqlRepository implements Repository {
  MysqlConnector _connection;
  ConnectionPool _mysql;

  MysqlRepository(MysqlConnector conn) {
    this._connection = conn;
    this._mysql = this._connection.SqlConnection;
  }

  Future<E> findOne<E>(Type type, [Filter filter]) async {
    if (filter == null) filter = new Filter(limit: 1);
    else filter.limit = 1;

    List elem = await this.findAll<E>(type, filter);
    return elem.length > 0 ? elem.first : null;
  }

  Future<List<E>> findAll<E>(Type type, [Filter filter]) async {
    List<E> elems = [];

    String table_name = ModelReflector.getName(type);
    table_name = "feeds";
    List<ModelProperty> table_properties = ModelReflector.getPropertiesFromType(type);

    String sql = "SELECT ${table_properties.map((prop) => prop.name).join(", ")} FROM ${table_name}";

    // TODO: Meter filtros

    Results res = await this._connection.SqlConnection.query(sql);

    await res.forEach((Row row) {
      List<ModelProperty> fields = new List<ModelProperty>.from(table_properties);
      for (var i = 0; i < fields.length; i++) {
        fields[i] = _fromMysql(fields[i], row[i]);
      }
      elems.add(ModelReflector.getModel(type, fields));
    });

    return elems;
  }

  Future<int> count<E>([Filter filter]) {}

  Future save<E>(E model) {}

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

  /// Convert mysql value as string to dart value
  ModelProperty _fromMysql(ModelProperty prop, value) {
    switch (prop.type) {
      case bool: prop.value = (int.parse(value.toString()) == 1) ? true : false; break;
      case int: prop.value = int.parse(value.toString()); break;
      case double: prop.value = double.parse(value.toString()); break;
      default: prop.value = value.toString();
    }

    return prop;
  }

  String _toMysql(ModelProperty prop) {
    switch (prop.type) {
      case bool: return prop.value ? "1" : "0";
      default: return "'${prop.value.toString()}'";
    }
  }
}