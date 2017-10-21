import 'dart:mirrors';
import 'model-property.dart';

class ModelReflector {
  static String getName(Object object) {
    InstanceMirror im = reflect(object);
    return MirrorSystem.getName(im.type.simpleName);
  }

  static List<ModelProperty> getProperties(Object object) {
    List<ModelProperty> properties = [];

    InstanceMirror im = reflect(object);
    ClassMirror cm = im.type;

    cm.declarations.forEach((Symbol key, DeclarationMirror value) {
      if (value is VariableMirror) {
        InstanceMirror valueInst = im.getField(key);
        properties.add(new ModelProperty(
            key, valueInst.reflectee, value.type.reflectedType));
      }
    });

    return properties;
  }

  static E getModel<E>(List<ModelProperty> properties) {
    throw new Exception("Not implemented yet");
  }
}
