part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {}

/// Sign in request event
class SignInRequest extends SignInEvent {
  SignInRequest({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
