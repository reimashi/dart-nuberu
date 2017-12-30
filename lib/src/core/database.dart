import 'dart:async';
import 'repository.dart';

/// Connection to a database
abstract class Database {
  Future connect();

  /// Send all pending queries.
  Future flush();

  /// Check if the manager is still connected.
  Future<bool> isConnected();

  /// Close the connection associated to this manager.
  Future disconnect();

  /// Add model of repository
  setModel(String name, Type type);

  /// Add multiple models of repositories
  setModels(Map<String, Type> models) {
    models.forEach(this.setModel);
  }

  Repository getRepo(String name);
}