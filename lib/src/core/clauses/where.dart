import 'clause.dart';
import 'clause_type.dart';
import 'package:nuberu/src/core/clauses/comparison.dart';

class Where extends Clause {
  final Comparison comparison;

  Where(Comparison comparison)
      : this.comparison = comparison,
        super(ClauseType.WHERE);
}
