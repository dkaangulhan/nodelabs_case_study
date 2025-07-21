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
          create: (context) => SignInBloc(),
        ),
      ],
      child: children[navigationShell.currentIndex],
    );
  }
}
