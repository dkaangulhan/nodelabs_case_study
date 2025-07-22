part of 'initialize_bloc.dart';

sealed class InitializeEvent extends Equatable {
  const InitializeEvent();

  @override
  List<Object> get props => [];
}

class InitializeApp extends InitializeEvent {}
