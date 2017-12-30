import 'comparison.dart';

enum OrderType {
  ASC,
  DESC,
  SHUFFLE
}

class OrderCondition {
  final OrderType type;
  final List<String> properties;

  const OrderCondition(OrderType type, List<String> properties);
}

class Condition<E> {
  final String type;
  final E value;

  const Condition(type, value);

  static Condition limit(int limit) => new Condition<int>("LIMIT", num);
  static Condition offset(int offset) => new Condition<int>("OFFSET", offset);
  static Condition contains(String property) => new Condition<String>("CONTAINS", property);
  static Condition order(OrderCondition orderCond) => new Condition<OrderCondition>("ORDER", orderCond);
  static Condition where(Comparison comp) => new Condition<Comparison>("WHERE", comp);
  // TODO: orWhere and agrupations
}