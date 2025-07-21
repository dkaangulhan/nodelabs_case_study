import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
