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
    return BlocConsumer<InitializeBloc, InitializeState>(
      listener: (context, state) {
        if (state is Success) {
          const SignInPageRouteData().go(context);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
