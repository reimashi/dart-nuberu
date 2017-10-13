import 'dart:async';
import 'nuberu_filter.dart';

abstract class NuberuMethods {
  Future<E> findOne<E>(NuberuFilter cond);

  Future<List<E>> findAll<E>(NuberuFilter cond);

  Future<int> count<E>(NuberuFilter cond);
}