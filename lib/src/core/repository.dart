import 'dart:async';
import 'query.dart';
import 'package:nuberu/src/core/clauses/clause.dart';

/// Active connection to a database/repository
abstract class Repository<E> {
  /// Create a new element
  Future<E> create();

  /// Count all elements of type [E] that meets the [filter].
  Query count();

  /// Delete the object [instance] of type [E].
  Future delete(E instance);

  /// Delete the object [instance] of type [E].
  Future deleteAll([List<Clause> clauses = const[]]);

  /// Checks if the object [model] of type [E] exists in the database.
  Future<bool> exists([List<Clause> clauses = const[]]);

  /// Find the first element.
  Query findOne([List<Clause> clauses = const[]]);

  /// Find all elements.
  Query findAll([List<Clause> clauses = const[]]);

  /// Get an element
  Future<E> get(id, [List<Clause> clauses = const[]]);

  /// Save the object
  Future save(E instance);

  /// Update the object with the actual data in database
  Future<E> update(E instance); // FIXME: imprescindible?

  /// Check if repository has a named [propName] property.
  bool hasProperty(String propName);
}