import 'dart:async';
import 'package:meta/meta.dart';
import 'filter.dart';
import 'connector.dart';

abstract class Repository {
  @protected
  /// Connection to the database.
  final Connector connector;

  @protected
  /// If true, all queries are automatic.
  final bool autocommit;

  Repository(Connector con)
      : connector = con,
        autocommit = false;

  Repository.transactional(Repository man)
      : connector = man.connector,
        autocommit = true;

  /// Find the first element of type [E] that meets the [filter].
  Future<E> findOne<E>([Filter filter]);

  /// Find all elements of type [E] that meets the [filter].
  Future<List<E>> findAll<E>([Filter filter]);

  /// Count all elements of type [E] that meets the [filter].
  Future<int> count<E>([Filter filter]);

  /// Save the object [model] of type [E]
  Future persist<E>(E model);

  /// Delete the object [model] of type [E].
  Future delete<E>(E model);

  /// Reload the object [model] of type [E] with the values in the database.
  Future refresh<E>(E model);

  /// Checks if the object [model] of type [E] exists in the database.
  Future<bool> exists<E>(E model);

  /// Remove all the elements in the repository [name], or all database if not specified.
  Future clear([String name]);

  /// Create a copy of the object [model] of type [E] and update the primary keys.
  Future<E> copy<E>(E model);

  /// Create a non-autocommited manager to execute multiple queries in one transaction.
  Repository transaction();

  /// Send all pending queries.
  Future flush();

  /// Check if the manager is still connected.
  Future<bool> isConnected();

  /// Close the connection associated to this manager.
  Future close();
}
