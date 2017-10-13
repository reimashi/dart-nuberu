
class NuberuProperty<E> {
  String name;
  E value;

  bool primary = false;
  bool unique = false;
  bool index = false;
  bool notnull = false;
  bool autoGenerate = false;

  NuberuProperty([
    String name = null
  ]);
}