import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case_study/register/view/register_page.dart';
import 'package:nodelabs_case_study/sign_in/view/sign_in_page.dart';

part 'routes.g.dart';

@TypedStatefulShellRoute<AuthScreenRouteData>(
  branches: [
    TypedStatefulShellBranch<SignInPageBranchData>(
      routes: [
        TypedGoRoute<SignInPageRouteData>(
          name: 'sign-in',
          path: '/sign-in',
        ),
      ],
    ),
    TypedStatefulShellBranch<RegisterPageBranchData>(
      routes: [
        TypedGoRoute<RegisterPageRouteData>(
          name: 'register',
          path: '/register',
        ),
      ],
    ),
  ],
)
@immutable
class AuthScreenRouteData extends StatefulShellRouteData {
  const AuthScreenRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      navigationShell;

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return children[navigationShell.currentIndex];
        },
      ),
    );
  }
}

@immutable
class SignInPageBranchData extends StatefulShellBranchData {
  const SignInPageBranchData();
}

@immutable
class SignInPageRouteData extends GoRouteData with _$SignInPageRouteData {
  const SignInPageRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignInPage();
}

@immutable
class RegisterPageBranchData extends StatefulShellBranchData {
  const RegisterPageBranchData();
}

@immutable
class RegisterPageRouteData extends GoRouteData with _$RegisterPageRouteData {
  const RegisterPageRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterPage();
}
