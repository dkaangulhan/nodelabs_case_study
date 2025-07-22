import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case_study/app_router/routes.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_case_study/sign_in/bloc/sign_in_bloc.dart';
import 'package:nodelabs_case_study/sign_in/mixin/sign_in_page_mixin.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SignInPageMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = context.t;
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInCompleted) {
          const FeedScreenRouteData().go(context);
        }
      },
      child: Scaffold(
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
                    l10n.greetings,
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
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      if (state is! SignInError) {
                        return const SizedBox();
                      }
                      return _ErrorBox(
                        error: state,
                      );
                    },
                  ),
                  NodelabsTextField(
                    controller: emailController,
                    iconPath: Assets.icons.message,
                    validator: emailValidator,
                    label: Text(l10n.email),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  NodelabsTextField(
                    controller: passwordController,
                    iconPath: Assets.icons.unlock,
                    validator: passwordValidator,
                    label: Text(l10n.password),
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      l10n.forgotPassword,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      final bloc = context.read<SignInBloc>();
                      final isLoading = bloc.state is SignInLoading;
                      return NodelabsPrimaryButton(
                        title: l10n.signIn,
                        isLoading: isLoading,
                        onTap: onSignIn,
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
                    height: 32,
                  ),
                  _NoAccountText(
                    onTap: () {
                      const RegisterPageRouteData().go(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NoAccountText extends StatelessWidget {
  const _NoAccountText({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.t;
    return Center(
      child: RichText(
        text: TextSpan(
          text: l10n.noAccount,
          children: [
            TextSpan(
              text: ' ${l10n.register}!',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorBox extends StatelessWidget {
  const _ErrorBox({required this.error});

  final SignInError error;

  @override
  Widget build(BuildContext context) {
    String message;
    switch (error) {
      case SignInInvalidCredentials():
        message = context.t.errors.invalidCredentials;
      case SignInUnknownError():
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
