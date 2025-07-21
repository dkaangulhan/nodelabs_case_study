import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
