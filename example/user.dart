import 'package:nuberu/nuberu.dart';

class UserModel extends NuberuModel {
  NuberuProperty<DateTime> birthdate;

  NuberuProperty<String> name;

  NuberuProperty<UserModel> parent;
}