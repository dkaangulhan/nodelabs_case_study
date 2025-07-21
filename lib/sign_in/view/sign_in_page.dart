import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case_study/app_router/routes.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.t;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
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
              NodelabsTextField(
                iconPath: Assets.icons.message,
                label: Text(l10n.email),
              ),
              const SizedBox(
                height: 14,
              ),
              NodelabsTextField(
                iconPath: Assets.icons.unlock,
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
              NodelabsPrimaryButton(
                title: l10n.signIn,
                onTap: () {},
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
