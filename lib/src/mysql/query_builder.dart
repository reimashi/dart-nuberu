import 'dart:async';
import 'package:sqljocky5/sqljocky.dart';
import 'package:nuberu/src/mysql/connector.dart';

import 'dart:mirrors';
/*
class MysqlRepository {
  MysqlConnector _connection;
  ConnectionPool _mysql;

  MysqlRepository(MysqlConnector conn) {
    this._connection = conn;
    this._mysql = this._connection.SqlConnection;
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

  Future refresh<E>(E model) {}

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

  @override
  Query count() {
    // TODO: implement count
  }

  @override
  Future create() {
    // TODO: implement create
  }

  @override
  Future delete(instance) {
    // TODO: implement delete
  }

  @override
  Future deleteAll([List<Clause> clauses = const []]) {
    // TODO: implement deleteAll
  }

  @override
  Future<bool> exists([List<Clause> clauses = const []]) {
    // TODO: implement exists
  }

  @override
  Future get(id, [List<Clause> clauses = const []]) {
    // TODO: implement get
  }

  @override
  bool hasProperty(String propName) {
    // TODO: implement hasProperty
  }

  @override
  Future save(instance) {
    // TODO: implement save
  }

  @override
  Future update(instance) {
    // TODO: implement update
  }

  @override
  Query findOne([List<Clause> clauses = const []]) {
    if (filter == null) filter = new Filter(limit: 1);
    else filter.limit = 1;

    List elem = await this.findAll<E>(type, filter);
    return elem.length > 0 ? elem.first : null;
  }
}*/