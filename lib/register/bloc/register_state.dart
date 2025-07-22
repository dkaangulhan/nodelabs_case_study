part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterCompleted extends RegisterState {}

sealed class RegisterError extends RegisterState {}

class UserExistsError extends RegisterError {}

class RegisterUnknownError extends RegisterError {}
