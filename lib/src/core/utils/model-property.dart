import 'dart:mirrors';

class ModelProperty<E> {
  final Symbol symbol;
  E value;
  final Type type;

  ModelProperty(Symbol name, Type type, [E value = null])
      : this.symbol = name,
        this.value = value,
        this.type = type;

  String get name => MirrorSystem.getName(this.symbol);

  String toString() {
    return "${this.type.toString()} ${this.name} = ${this.value.toString()}";
  }
}