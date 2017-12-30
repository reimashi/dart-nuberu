enum ComparisonOperator {
  LESS,
  GREAT,
  EQUAL,
  NOT_EQUAL,
  LESS_OR_EQUAL,
  GREAT_OR_EQUAL,
  IN,
  CONTAINS
}

class Comparison {
  final subject;

  ComparisonOperator _comparison;
  ComparisonOperator get comparison => _comparison;

  final predicate;

  Comparison(subject, comparison, [predicate = null])
      : this.subject = subject,
        this.predicate = predicate {
    if (comparison is ComparisonOperator) {
      this._comparison = comparison;
    } else {
      switch (comparison.toString().toLowerCase().trim()) {
        case "in":
          this._comparison = ComparisonOperator.IN;
          break;
        case "contains":
          this._comparison = ComparisonOperator.CONTAINS;
          break;
        case "<>":
        case "!=":
          this._comparison = ComparisonOperator.NOT_EQUAL;
          break;
        case ">":
          this._comparison = ComparisonOperator.GREAT;
          break;
        case ">=":
        case "=>":
          this._comparison = ComparisonOperator.GREAT_OR_EQUAL;
          break;
        case "<":
          this._comparison = ComparisonOperator.LESS;
          break;
        case "<=":
        case "=<":
          this._comparison = ComparisonOperator.LESS_OR_EQUAL;
          break;
        case "=":
        case "==":
        default:
          this._comparison = ComparisonOperator.EQUAL;
          break;
      }
    }
  }
}
