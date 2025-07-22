import 'package:auth_repository/auth_repository.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case_study/app_router/routes.dart';
import 'package:nodelabs_case_study/initialize/bloc/initialize_bloc.dart';

class InitializeScreen extends StatelessWidget {
  const InitializeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return InitializeBloc(
          cacheRepository: context.read<CacheRepository>(),
          authRepository: context.read<AuthRepository>(),
        )..add(InitializeApp());
      },
      child: const _Loading(),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitializeBloc, InitializeState>(
      listener: (context, state) {
        switch (state) {
          case InitializeInitial():
            return;
          case Success():
            const SignInPageRouteData().go(context);
        }
      },
      child: const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
