import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case_study/app/state/app_state.dart';
import 'package:nodelabs_case_study/auth/view/view.dart';
import 'package:nodelabs_case_study/feed/view/feed_page.dart';
import 'package:nodelabs_case_study/home/view/home_screen.dart';
import 'package:nodelabs_case_study/initialize/view/initialize_screen.dart';
import 'package:nodelabs_case_study/profile/view/profile_page.dart';
import 'package:nodelabs_case_study/register/view/register_page.dart';
import 'package:nodelabs_case_study/sign_in/view/sign_in_page.dart';

part 'routes.g.dart';

@TypedGoRoute<InitializeScreenRouteData>(
  name: 'initialize',
  path: '/initialize',
)
class InitializeScreenRouteData extends GoRouteData
    with _$InitializeScreenRouteData {
  const InitializeScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const InitializeScreen();
}

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
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (appState.value.isLoggedIn) {
      return const FeedPageRouteData().location;
    }
    return null;
  }

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
    return AuthScreen(navigationShell: navigationShell, children: children);
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

@TypedStatefulShellRoute<HomeScreenRouteData>(
  branches: [
    TypedStatefulShellBranch<FeedPageBranchData>(
      routes: [
        TypedGoRoute<FeedPageRouteData>(
          name: 'feed',
          path: '/feed',
        ),
      ],
    ),
    TypedStatefulShellBranch<ProfilePageBranchData>(
      routes: [
        TypedGoRoute<ProfilePageRouteData>(
          name: 'profile',
          path: '/profile',
        ),
      ],
    ),
  ],
)
@immutable
class HomeScreenRouteData extends StatefulShellRouteData {
  const HomeScreenRouteData();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (!appState.value.isLoggedIn) {
      return const SignInPageRouteData().location;
    }
    return null;
  }

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
    return HomeScreen(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

@immutable
class FeedPageBranchData extends StatefulShellBranchData {
  const FeedPageBranchData();
}

@immutable
class FeedPageRouteData extends GoRouteData with _$FeedPageRouteData {
  const FeedPageRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) => const FeedPage();
}

@immutable
class ProfilePageBranchData extends StatefulShellBranchData {
  const ProfilePageBranchData();
}

@immutable
class ProfilePageRouteData extends GoRouteData with _$ProfilePageRouteData {
  const ProfilePageRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfilePage();
}
