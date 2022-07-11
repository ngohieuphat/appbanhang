// state lop truy xuat
import 'package:flutter/material.dart';

@immutable
abstract class DataState {}

class DataInitialState extends DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState {
  final api;
  DataLoadedState({this.api});
}

class DataErrorState extends DataState {}
