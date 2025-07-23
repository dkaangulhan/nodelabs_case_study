import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_case_study/limited_offer/view/limited_offer.dart';
import 'package:nodelabs_case_study/profile/bloc/profile_bloc.dart';
import 'package:nodelabs_case_study/user_card/view/user_card.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) {
        final bloc = ProfileBloc(
          movieRepository: context.read<MovieRepository>(),
        )..add(LoadFavoriteMovies());
        return bloc;
      },
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(context.t.profile),
                actions: [
                  NodelabsFilledButton(
                    title: context.t.limitedOffer,
                    onTap: () {
                      LimitedOffer.show(context: context);
                    },
                  ),
                ],
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              // User card
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  child: UserCard(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              // Title - favorite movies
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  child: Text(
                    context.t.favoriteMovies,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              if (state.favoriteMoviesState != FavoriteMoviesState.loaded)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 26,
                    ),
                    child: Text('Not loaded'),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: state.favoriteMovies.length,
                    itemBuilder: (context, index) {
                      return _FavoriteMovieCard(
                        movie: state.favoriteMovies[index],
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _FavoriteMovieCard extends StatelessWidget {
  const _FavoriteMovieCard({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(movie.poster!).replace(scheme: 'https');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: uri.toString(),
              fit: BoxFit.cover,
              errorListener: (value) {},
              errorWidget: (context, url, error) {
                return ColoredBox(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.1),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          movie.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          movie.type!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
