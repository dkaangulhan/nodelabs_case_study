import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case_study/app_router/routes.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_case_study/register/bloc/register_bloc.dart';
import 'package:nodelabs_case_study/register/mixin/register_page_mixin.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterPageMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = context.t;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: [
                Text(
                  l10n.welcome,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  l10n.welcomeBody,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is! RegisterError) {
                      return const SizedBox();
                    }
                    return _ErrorBox(
                      error: state,
                    );
                  },
                ),
                // Name surname
                NodelabsTextField(
                  iconPath: Assets.icons.addUser,
                  controller: nameController,
                  validator: nameSurnameValidator,
                  label: Text(l10n.nameSurname),
                ),
                const SizedBox(
                  height: 14,
                ),
                // Email
                NodelabsTextField(
                  iconPath: Assets.icons.message,
                  controller: emailController,
                  validator: emailValidator,
                  label: Text(l10n.email),
                ),
                const SizedBox(
                  height: 14,
                ),
                // Password
                NodelabsTextField(
                  iconPath: Assets.icons.unlock,
                  controller: passwordController,
                  validator: passwordValidator,
                  label: Text(l10n.password),
                  isPassword: true,
                ),
                const SizedBox(
                  height: 14,
                ),
                // Password again
                NodelabsTextField(
                  iconPath: Assets.icons.unlock,
                  controller: passwordAgainController,
                  validator: passwordAgainValidator,
                  label: Text(l10n.passwordRepeat),
                  isPassword: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                _TermsText(
                  onTap: () {
                    const SignInPageRouteData().go(context);
                  },
                ),
                const SizedBox(
                  height: 36,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    final isLoading = state is RegisterLoading;
                    return NodelabsPrimaryButton(
                      title: l10n.register,
                      isLoading: isLoading,
                      onTap: onRegister,
                    );
                  },
                ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    SocialMediaIcon(
                      iconPath: Assets.icons.google,
                      onTap: () {},
                    ),
                    SocialMediaIcon(
                      iconPath: Assets.icons.apple,
                    ),
                    SocialMediaIcon(
                      iconPath: Assets.icons.facebook,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                const _AlreadyHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AlreadyHaveAccountText extends StatelessWidget {
  const _AlreadyHaveAccountText();

  @override
  Widget build(BuildContext context) {
    final l10n = context.t;
    return RichText(
      textAlign: TextAlign.center,
      text: l10n.alreadyHaveAnAccount(
        value: TextSpan(
          text: l10n.signIn,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              const SignInPageRouteData().go(context);
            },
        ),
      ),
    );
  }
}

class _TermsText extends StatelessWidget {
  const _TermsText({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.t;
    return Center(
      child: RichText(
        text: l10n.readAndAcceptTerms(
          read: TextSpan(
            text: l10n.read,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          acceptTerms: TextSpan(
            text: l10n.accept,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          userTerms: TextSpan(
            text: l10n.userTerms,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorBox extends StatelessWidget {
  const _ErrorBox({required this.error});

  final RegisterError error;

  @override
  Widget build(BuildContext context) {
    String message;
    switch (error) {
      case UserExistsError():
        message = context.t.errors.userExists;
      case RegisterUnknownError():
        message = context.t.errors.unknown;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: NodelabsErrorBox(
        errors: [message],
      ),
    );
  }
}
