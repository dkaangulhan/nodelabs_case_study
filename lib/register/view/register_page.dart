import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case_study/app_router/routes.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.t;
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
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
            NodelabsTextField(
              iconPath: Assets.icons.addUser,
              label: Text(l10n.nameSurname),
            ),
            const SizedBox(
              height: 14,
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
              height: 14,
            ),
            NodelabsTextField(
              iconPath: Assets.icons.unlock,
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
            NodelabsPrimaryButton(
              title: l10n.register,
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
              height: 36,
            ),
            const _AlreadyHaveAccountText(),
          ],
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
