import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case_study/sign_in/bloc/sign_in_bloc.dart';
import 'package:nodelabs_case_study/sign_in/view/sign_in_page.dart';
import 'package:nodelabs_case_study/utils/validators.dart';

mixin SignInPageMixin on State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'safa@nodelabs.com');
  final passwordController = TextEditingController(text: '123456');

  String? emailValidator(String? value) {
    return Validators.emailValidator(context: context, value: value);
  }

  String? passwordValidator(String? value) {
    return Validators.passwordValidator(context: context, value: value);
  }

  Future<void> onSignIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    context.read<SignInBloc>().add(
          SignInRequest(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
