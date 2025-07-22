// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $initializeScreenRouteData,
      $authScreenRouteData,
    ];

RouteBase get $initializeScreenRouteData => GoRouteData.$route(
      path: '/initialize',
      name: 'initialize',
      factory: _$InitializeScreenRouteData._fromState,
    );

mixin _$InitializeScreenRouteData on GoRouteData {
  static InitializeScreenRouteData _fromState(GoRouterState state) =>
      const InitializeScreenRouteData();

  @override
  String get location => GoRouteData.$location(
        '/initialize',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authScreenRouteData => StatefulShellRouteData.$route(
      navigatorContainerBuilder: AuthScreenRouteData.$navigatorContainerBuilder,
      factory: $AuthScreenRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/sign-in',
              name: 'sign-in',
              factory: _$SignInPageRouteData._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/register',
              name: 'register',
              factory: _$RegisterPageRouteData._fromState,
            ),
          ],
        ),
      ],
    );

extension $AuthScreenRouteDataExtension on AuthScreenRouteData {
  static AuthScreenRouteData _fromState(GoRouterState state) =>
      const AuthScreenRouteData();
}

mixin _$SignInPageRouteData on GoRouteData {
  static SignInPageRouteData _fromState(GoRouterState state) =>
      const SignInPageRouteData();

  @override
  String get location => GoRouteData.$location(
        '/sign-in',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$RegisterPageRouteData on GoRouteData {
  static RegisterPageRouteData _fromState(GoRouterState state) =>
      const RegisterPageRouteData();

  @override
  String get location => GoRouteData.$location(
        '/register',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
