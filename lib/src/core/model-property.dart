import 'dart:mirrors';

class ModelProperty<E> {
  final Symbol name;
  final E value;
  final Type type;

  ModelProperty(Symbol name, E value, Type type)
      : this.name = name,
        this.value = value,
        this.type = type;

  String toString() {
    return "${this.type.toString()} ${MirrorSystem.getName(this.name)} = ${this.value.toString()}";
  }
}