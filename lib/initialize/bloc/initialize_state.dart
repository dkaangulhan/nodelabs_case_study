part of 'initialize_bloc.dart';

sealed class InitializeState extends Equatable {
  const InitializeState();

  @override
  List<Object> get props => [];
}

final class InitializeInitial extends InitializeState {}

final class Success extends InitializeState {}
