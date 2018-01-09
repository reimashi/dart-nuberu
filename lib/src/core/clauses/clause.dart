import 'package:nuberu/src/core/clauses/comparison.dart';
import 'clause_type.dart';

class Clause {
  final ClauseType type;

  const Clause(ClauseType type) : this.type = type;

  //static Clause where(Comparison comp) => new Clause<Comparison>("WHERE", comp);
  // TODO: orWhere and agrupations
  // TODO: LIKE match
  // distinct
}
