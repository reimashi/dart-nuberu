import 'dart:async';
import 'query_type.dart';
import 'package:nuberu/src/core/clauses/clause.dart';
import 'package:nuberu/src/core/clauses/clause_type.dart';
import 'package:nuberu/src/core/clauses/contains.dart';
import 'package:nuberu/src/core/clauses/comparison.dart';
import 'package:nuberu/src/core/clauses/limit.dart';
import 'package:nuberu/src/core/clauses/offset.dart';
import 'package:nuberu/src/core/clauses/order.dart';
import 'package:nuberu/src/core/clauses/order_type.dart';
import 'package:nuberu/src/core/clauses/where.dart';

abstract class Query {
  final QueryType type;
  
  List<Clause> _clauses = [];
  Map<String, Object> _values = {};

  Query.Get() : type = QueryType.GET;
  Query.Create() : type = QueryType.CREATE;
  Query.Update() : type = QueryType.UPDATE;
  Query.Delete() : type = QueryType.DELETE;

  /// Reset all the filters
  void all() {
    this._clauses.removeWhere((clause) =>
      [ClauseType.CONTAINS, ClauseType.LIMIT].contains(clause.type)
    );
  }

  /// Get only elements with the [properties] at not null
  void contains(List<String> properties) {
    properties.forEach((prop) {
      this._clauses.add(new Contains(prop));
    });
  }

  /// Set a [limit] of elements to retrieve
  void limit(int limit) {
    this._clauses.retainWhere((cond) => cond.type != ClauseType.LIMIT);
    this._clauses.add(new Limit(limit));
  }

  /// Skip a [number] of elements before retrieve.
  void offset(int number, [int page = -1]) {
    this._clauses.retainWhere((cond) => cond.type != ClauseType.OFFSET);
    this._clauses.add(new Offset((page == -1) ? number : page * number));
  }

  /// Order the result
  /// TODO: FIX? Multiple fields with different orders
  void order(order, [List<String> fields = const[]]) {
    OrderType porder;

    if (order is OrderType) {
      porder = order;
    }
    else {
      switch (order.toString().toLowerCase()) {
        case "asc":case "ascendant":
          porder = OrderType.ASC;
          break;
        case "shuffle":case "random":
          porder = OrderType.SHUFFLE;
          break;
        case "desc":case "descendant":default:
          porder = OrderType.DESC;
          break;
      }
    }

    this._clauses.retainWhere((cond) => cond.type != ClauseType.ORDER);
    this._clauses.add(new Order(fields, porder));
  }

  /// Set a comparison or condition from [subject] to a [predicate]
  void where(subject, predicate, [comparisonOp = "=="]) {
    this._clauses.retainWhere((cond) => cond.type != ClauseType.WHERE);
    this._clauses.add(new Where(new Comparison(subject, predicate, comparisonOp)));
  }

  /// Set the [values] on create or update query
  void values(Map<String, Object> values) {
    if (this.type == QueryType.CREATE || this.type == QueryType.UPDATE) {
      this._values = values;
    }
    else {
      throw new ArgumentError("Only CREATE or UPDATE queries can have values"); // TODO: Personalize exception
    }
  }

  /// Count the number of elements for this filters
  Future<int> count();

  /// TODO: No me queda claro
  // Future<QueryResult> flush();
  // Future<bool> exists();
}