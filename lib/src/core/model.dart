import 'package:meta/meta.dart';
import 'dart:mirrors';

class Property {
  final String name;
  final value;
  final Type type;

  Property(String name, value)
      : this.name = name,
        this.value = value,
        this.type = reflect(value).type.reflectedType;
}

class Model<E> {
  @protected
  Type type;
  InstanceMirror _instance;
  ClassMirror _class;

  List<Property> _properties;

  Model() {
    InstanceMirror _typeInstance = reflect(E);
    this.type = _typeInstance.reflectee;

    print(this.type.toString());

    TypeMirror _typeMirror = reflectType(this.type);
  }

  List<Property> getProperties(ClassMirror cm) {
    List<Property> properties = [];

    Iterable<DeclarationMirror> decls = cm.declarations.values;

    cm.declarations.forEach((Symbol key, DeclarationMirror value) {
      if (value is VariableMirror) {
        print(key.toString());
      }
    });

    return properties;
  }
}
