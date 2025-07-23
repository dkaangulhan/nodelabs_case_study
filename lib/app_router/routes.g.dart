// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $initializeScreenRouteData,
      $authScreenRouteData,
      $homeScreenRouteData,
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

RouteBase get $homeScreenRouteData => StatefulShellRouteData.$route(
      navigatorContainerBuilder: HomeScreenRouteData.$navigatorContainerBuilder,
      factory: $HomeScreenRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/feed',
              name: 'feed',
              factory: _$FeedPageRouteData._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              name: 'profile',
              factory: _$ProfilePageRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'update-photo',
                  name: 'update-photo',
                  factory: _$UpdatePhotoRouteData._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $HomeScreenRouteDataExtension on HomeScreenRouteData {
  static HomeScreenRouteData _fromState(GoRouterState state) =>
      const HomeScreenRouteData();
}

mixin _$FeedPageRouteData on GoRouteData {
  static FeedPageRouteData _fromState(GoRouterState state) =>
      const FeedPageRouteData();

  @override
  String get location => GoRouteData.$location(
        '/feed',
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

mixin _$ProfilePageRouteData on GoRouteData {
  static ProfilePageRouteData _fromState(GoRouterState state) =>
      const ProfilePageRouteData();

  @override
  String get location => GoRouteData.$location(
        '/profile',
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

mixin _$UpdatePhotoRouteData on GoRouteData {
  static UpdatePhotoRouteData _fromState(GoRouterState state) =>
      const UpdatePhotoRouteData();

  @override
  String get location => GoRouteData.$location(
        '/profile/update-photo',
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
