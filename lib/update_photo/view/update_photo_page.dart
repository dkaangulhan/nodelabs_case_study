import 'dart:io';

import 'package:cache_repository/cache_repository.dart';
import 'package:external_media_repository/external_media_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_case_study/update_photo/bloc/update_photo_bloc.dart';
import 'package:nodelabs_case_study/utils/display_message.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';
import 'package:user_repository/user_repository.dart';

/// Profile photo update page.
class UpdatePhotoPage extends StatelessWidget {
  /// Profile photo update page.
  const UpdatePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UpdatePhotoBloc(
          externalMediaRepository: context.read<ExternalMediaRepository>(),
          userRepository: context.read<UserRepository>(),
          cacheRepository: context.read<CacheRepository>(),
        );
      },
      child: const _Content(),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  void _displayErrorMessage() {
    final errorState =
        context.read<UpdatePhotoBloc>().state as PhotoUploadError;
    var message = context.t.errors.unknown;
    if (errorState.error is EntityTooLargeException) {
      message = context.t.errors.entityTooLarge;
    }
    displayMessage(
      context: context,
      message: message,
      type: MessageType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocListener<UpdatePhotoBloc, UpdatePhotoState>(
            listener: (context, state) {
              if (state is PhotoUploadError) {
                _displayErrorMessage();
              }
              if (state is PhotoUploadedState) {
                GoRouter.of(context).pop();
              }
            },
            child: Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [
                  Text(
                    context.t.loadPhotos,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    context.t.loadPhotosDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    child: BlocBuilder<UpdatePhotoBloc, UpdatePhotoState>(
                      builder: (context, state) {
                        return _PickImageButton(
                          pickedImage: state.pickedImage,
                          onTap: () {
                            context.read<UpdatePhotoBloc>().add(PickImage());
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<UpdatePhotoBloc, UpdatePhotoState>(
                builder: (context, state) {
                  return NodelabsPrimaryButton(
                    title: context.t.kContinue,
                    isLoading: state is PhotoUploadingState,
                    onTap: () {
                      context.read<UpdatePhotoBloc>().add(UpdatePhoto());
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PickImageButton extends StatelessWidget {
  const _PickImageButton({
    required this.pickedImage,
    required this.onTap,
  });

  final File? pickedImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 164,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(
              alpha: 0.1,
            ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(
                alpha: 0.1,
              ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Builder(
            builder: (context) {
              if (pickedImage == null) {
                return Center(
                  child: Icon(
                    Icons.add,
                    size: 50,
                    color: Theme.of(context).colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                  ),
                );
              }
              return Image.file(
                pickedImage!,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
