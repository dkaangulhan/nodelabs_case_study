import 'package:auth_repository/auth_repository.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case_study/sign_in/bloc/sign_in_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    required this.navigationShell,
    required this.children,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return SignInBloc(
              authRepository: context.read<AuthRepository>(),
              cacheRepository: context.read<CacheRepository>(),
            );
          },
        ),
      ],
      child: _AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
    );
  }
}

class _AnimatedBranchContainer extends StatelessWidget {
  const _AnimatedBranchContainer({
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed(
        (int index, Widget navigator) {
          return AnimatedSlide(
            duration: const Duration(milliseconds: 600),
            curve: index == currentIndex ? Curves.easeOut : Curves.easeInOut,
            offset: Offset(
              index == currentIndex ? 0 : 0.25,
              0,
            ),
            child: AnimatedOpacity(
              opacity: index == currentIndex ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: index != currentIndex,
                child: TickerMode(
                  enabled: index == currentIndex,
                  child: navigator,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
