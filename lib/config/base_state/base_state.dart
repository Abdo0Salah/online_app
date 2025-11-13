import 'package:equatable/equatable.dart';

class BaseState<T> extends Equatable {
  bool? isLoading;
  String? errorMessage;
  T? data;

  BaseState({this.isLoading = false, this.errorMessage, this.data});
  @override
  List<Object?> get props => [isLoading, errorMessage, data];
}
