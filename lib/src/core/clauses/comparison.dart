enum ComparisonOperator {
  LESS,
  GREAT,
  EQUAL,
  NOT_EQUAL,
  LESS_OR_EQUAL,
  GREAT_OR_EQUAL,
  IN,
  NOT_IN
}

class Comparison {
  final subject;

  ComparisonOperator _comparison;
  ComparisonOperator get comparison => _comparison;

  final predicate;

  Comparison(subject, [predicate = null, comparisonOp = ComparisonOperator.EQUAL])
      : this.subject = subject,
        this.predicate = predicate {
    // If subject is a String and contains an operator
    if (subject is String) {
      List<String> subjectParts = subject.toString().split(" ");

      if (subjectParts.length > 1) {
        subject = subjectParts[0];
        comparisonOp = subjectParts[1];
      }
    }

    if (comparisonOp is ComparisonOperator) {
      this._comparison = comparisonOp;
    } else {
      switch (comparisonOp.toString().toLowerCase().trim()) {
        case "in":
          this._comparison = ComparisonOperator.IN;
          break;
        case "not in":
          this._comparison = ComparisonOperator.NOT_IN;
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
