import 'dart:async';
import 'query_type.dart';
import 'condition.dart';
import 'comparison.dart';

abstract class Query {
  final QueryType type;
  
  List<Condition> _conditions = [];
  Map<String, Object> _values = {};

  Query.Get() : type = QueryType.GET;
  Query.Create() : type = QueryType.CREATE;
  Query.Update() : type = QueryType.UPDATE;
  Query.Delete() : type = QueryType.DELETE;

  /// Reset all the filters
  void all() {
    this._conditions.clear();
  }

  /// Get only elements with the [properties] at not null
  void contains(List<String> properties) {
    properties.forEach((prop) {
      this._conditions.add(Condition.contains(prop));
    });
  }

  /// Set a [limit] of elements to retrieve
  void limit(int limit) {
    this._conditions.retainWhere((cond) => cond.type != "LIMIT");
    this._conditions.add(Condition.limit(limit));
  }

  /// Skip a [number] of elements before retrieve.
  void offset(int number, [int page = -1]) {
    this._conditions.retainWhere((cond) => cond.type != "OFFSET");
    this._conditions.add(Condition.offset((page == -1) ? number : page * number));
  }

  /// Order the result
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

    this._conditions.retainWhere((cond) => cond.type != "ORDER");
    this._conditions.add(Condition.order(new OrderCondition(porder, fields)));
  }

  /// Set a [value] condition over a [property]
  void where(String property, value, [comp = ComparisonOperator.EQUAL]) {
    this._conditions.add(Condition.where(new Comparison(property, value, comp)));
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