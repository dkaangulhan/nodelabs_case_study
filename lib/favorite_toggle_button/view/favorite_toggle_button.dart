import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/favorite_toggle_button/cubit/favorite_toggle_button_cubit.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class FavoriteToggleButton extends StatefulWidget {
  const FavoriteToggleButton({required this.movie, super.key});

  final Movie movie;

  @override
  State<FavoriteToggleButton> createState() => _FavoriteToggleButtonState();
}

class _FavoriteToggleButtonState extends State<FavoriteToggleButton> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return FavoriteToggleButtonCubit(
          movie: widget.movie,
          movieRepository: context.read<MovieRepository>(),
        );
      },
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(
              alpha: 0.2,
            ),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(
                alpha: 0.2,
              ),
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: context.read<FavoriteToggleButtonCubit>().toggleFavorite,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 26,
            ),
            child: Center(
              child: BlocBuilder<FavoriteToggleButtonCubit,
                  FavoriteToggleButtonState>(
                builder: (context, state) {
                  final isFavorited = state.movie.isFavorite ?? false;
                  return SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgIcon(
                      iconPath: isFavorited
                          ? Assets.icons.heart
                          : Assets.icons.heartOutline,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
