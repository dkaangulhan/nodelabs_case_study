import 'package:flutter/widgets.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';

abstract class Validators {
  static String? emailValidator({
    required BuildContext context,
    String? value,
  }) {
    if (value == null || value.trim().isEmpty) {
      return context.t.validators.email.empty;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return context.t.validators.email.notValid;
    }

    return null;
  }

  static String? passwordValidator({
    required BuildContext context,
    String? value,
  }) {
    if (value == null || value.trim().isEmpty) {
      return context.t.validators.password.empty;
    }

    if (value.length < 6) {
      return context.t.validators.password.length;
    }

    return null;
  }

  static String? passwordAgainValidator({
    required BuildContext context,
    required String password,
    String? value,
  }) {
    if (value == null || value.trim().isEmpty) {
      return context.t.validators.password.reEnterPassword;
    }

    if (value != password) {
      return context.t.validators.password.passwordDontMatch;
    }

    return null;
  }

  static String? nameSurnameValidator({
    required BuildContext context,
    String? value,
  }) {
    if (value == null || value.trim().isEmpty) {
      return context.t.validators.nameSurname.empty;
    }

    final parts = value.trim().split(' ');
    if (parts.length < 2) {
      return context.t.validators.nameSurname.nameAndSurname;
    }

    return null;
  }
}
