import 'order_type.dart';
import 'clause.dart';
import 'clause_type.dart';

class Order extends Clause {
  final OrderType orderType;
  final List<String> properties;

  Order(List<String> properties, [OrderType type = OrderType.ASC])
      : this.properties = properties,
        this.orderType = type,
        super(ClauseType.ORDER);
}
