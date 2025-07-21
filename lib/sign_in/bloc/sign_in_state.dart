part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {
  const SignInState();
}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInCompleted extends SignInState {}

sealed class SignInError extends SignInState {}

final class SignInInvalidCredentials extends SignInError {}

final class SignInUnknownError extends SignInError {}
