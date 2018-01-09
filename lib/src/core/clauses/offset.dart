import 'clause.dart';
import 'clause_type.dart';

class Offset extends Clause {
  final int count;

  Offset(int count)
      : this.count = count,
        super(ClauseType.OFFSET);
}
