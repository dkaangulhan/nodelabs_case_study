import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

final class AppState extends Equatable {
  const AppState({
    required this.isLoggedIn,
    required this.navigatorKey,
  });

  final bool isLoggedIn;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  List<Object> get props => [isLoggedIn];

  AppState copyWith({
    bool? isLoggedIn,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    return AppState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      navigatorKey: navigatorKey ?? this.navigatorKey,
    );
  }
}

final appState = ValueNotifier(
  AppState(
    isLoggedIn: false,
    navigatorKey: GlobalKey<NavigatorState>(),
  ),
);
