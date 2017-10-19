import 'dart:async';
import 'package:nuberu/src/core/repository.dart';

abstract class Connector {
  Future<Repository> connect();
  Future disconnect();
}