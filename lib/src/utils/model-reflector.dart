import 'dart:mirrors';
import 'model-property.dart';

class ModelReflector {
  static String getNameFromObject(Object object) {
    InstanceMirror im = reflect(object);
    return MirrorSystem.getName(im.type.simpleName);
  }

  static String getName(Type t) {
    TypeMirror cm = reflectType(t);
    return MirrorSystem.getName(cm.simpleName);
  }

  static List<ModelProperty> getPropertiesFromType(Type t) {
    List<ModelProperty> properties = [];

    ClassMirror cm = reflectType(t);

    cm.declarations.forEach((Symbol key, DeclarationMirror value) {
      if (value is VariableMirror) {
        properties.add(new ModelProperty(key, value.type.reflectedType));
      }
    });

    return properties;
  }

  static List<ModelProperty> getProperties(Object object) {
    List<ModelProperty> properties = [];

    InstanceMirror im = reflect(object);
    ClassMirror cm = im.type;

    cm.declarations.forEach((Symbol key, DeclarationMirror value) {
      if (value is VariableMirror) {
        InstanceMirror valueInst = im.getField(key);
        properties.add(new ModelProperty(
            key, value.type.reflectedType, valueInst.reflectee));
      }
    });

    return properties;
  }

  static E getModel<E>(Type t, List<ModelProperty> properties) {
    ClassMirror cm = reflectClass(t);
    InstanceMirror im = cm.newInstance(const Symbol(''), []);

    properties.forEach((property) {
      im.setField(property.symbol, property.value);
    });

    return im.reflectee;
  }
}
