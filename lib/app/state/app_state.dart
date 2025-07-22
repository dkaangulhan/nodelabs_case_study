import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

final class AppState extends Equatable {
  const AppState({required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  List<Object> get props => [isLoggedIn];

  AppState copyWith({
    bool? isLoggedIn,
  }) {
    return AppState(isLoggedIn: isLoggedIn ?? this.isLoggedIn);
  }
}

final appState = ValueNotifier(const AppState(isLoggedIn: false));
