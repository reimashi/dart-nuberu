import 'clause.dart';
import 'clause_type.dart';

class Limit extends Clause {
  final int count;

  Limit(int count)
      : this.count = count,
        super(ClauseType.LIMIT);
}
