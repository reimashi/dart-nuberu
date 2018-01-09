import 'clause.dart';
import 'clause_type.dart';

// Contains not null or empty fields
class Contains extends Clause {
  final String field;

  Contains(String field)
      : this.field = field,
        super(ClauseType.CONTAINS);
}
