import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case_study/register/bloc/register_bloc.dart';
import 'package:nodelabs_case_study/register/view/register_page.dart';
import 'package:nodelabs_case_study/utils/validators.dart';

mixin RegisterPageMixin on State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: 'Test Test');
  final emailController = TextEditingController(text: 'ktest@test.com');
  final passwordController = TextEditingController(text: '123456');
  final passwordAgainController = TextEditingController(text: '123456');

  String? nameSurnameValidator(String? value) {
    return Validators.nameSurnameValidator(context: context, value: value);
  }

  String? emailValidator(String? value) {
    return Validators.emailValidator(context: context, value: value);
  }

  String? passwordValidator(String? value) {
    return Validators.passwordValidator(context: context, value: value);
  }

  String? passwordAgainValidator(String? value) {
    return Validators.passwordAgainValidator(
      context: context,
      password: passwordController.text,
      value: value,
    );
  }

  Future<void> onRegister() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    context.read<RegisterBloc>().add(
          RegisterRequest(
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text,
          ),
        );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    super.dispose();
  }
}
