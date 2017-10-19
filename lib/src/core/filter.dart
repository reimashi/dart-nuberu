import 'comparison.dart';

/// Define filters to a query
class Filter {
  /// The limit of elements in the query.
  int limit = -1;

  /// Elements to skip in the beginning of the list.
  int offset = 0;

  /// If true, the list return inverted.
  bool inverted = false;

  /// Ordered by properties.
  List<String> order = [];

  /// Grouped by properties.
  List<String> group = [];

  /// A list of where clauses.
  /// The sublist set the AND groups. The list set the OR groups.
  List<List<Comparison>> where = [];

  /// A list of properties to populate.
  List<String> populate = [];

  Filter({int this.limit = -1});
}