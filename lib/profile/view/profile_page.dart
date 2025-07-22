import 'package:flutter/material.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_case_study/user_card/view/user_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.profile),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 30,
        ),
        children: const [
          UserCard(),
        ],
      ),
    );
  }
}
