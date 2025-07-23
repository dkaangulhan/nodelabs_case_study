import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_case_study/user_card/bloc/user_card_bloc.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';
import 'package:user_repository/user_repository.dart';

const _photoSize = 60.0;

/// Card for displaying user's short info.
class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserCardBloc(
          userRepository: context.read<UserRepository>(),
        )..add(LoadUser());
      },
      child: const _UserCardContent(),
    );
  }
}

class _UserCardContent extends StatelessWidget {
  const _UserCardContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCardBloc, UserCardState>(
      builder: (context, state) {
        if (state is UserNotLoaded) {
          return const Placeholder();
        }
        final user = (state as UserLoaded).user;
        return Row(
          children: [
            // Profile photo
            Container(
              width: _photoSize,
              height: _photoSize,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CachedNetworkImage(
                imageUrl: user.photoUrl!,
                fit: BoxFit.cover,
                errorListener: (value) {},
                errorWidget: (context, url, error) {
                  return ColoredBox(color: Colors.white.withValues(alpha: 0.5));
                },
              ),
            ),
            const SizedBox(width: 10),
            // Name and id
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    'ID: ${user.id}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(
                                alpha: 0.5,
                              ),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            // Add Photo Button
            NodelabsFilledButton(
              onTap: () {},
              title: context.t.addPhoto,
            ),
          ],
        );
      },
    );
  }
}
