import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

final class App extends Equatable {
  const App({required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  List<Object> get props => [isLoggedIn];

  App copyWith({
    bool? isLoggedIn,
  }) {
    return App(isLoggedIn: isLoggedIn ?? this.isLoggedIn);
  }
}

final appState = ValueNotifier(const App(isLoggedIn: false));
