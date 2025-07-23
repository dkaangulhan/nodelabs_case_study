import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/favorite_toggle_button/view/favorite_toggle_button.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class MoviePoster extends StatefulWidget {
  const MoviePoster({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  State<MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<MoviePoster> {
  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(widget.movie.poster!).replace(scheme: 'https');
    return Stack(
      children: [
        // Image
        Positioned.fill(
          bottom: NodelabsCaseStudyTheme.homeScreenPadding(context).bottom +
              NodelabsCaseStudyTheme.homeScreenBottomNavbarHeight,
          child: CachedNetworkImage(
            imageUrl: uri.toString(),
            fit: BoxFit.cover,
            errorListener: (value) {},
            errorWidget: (context, url, error) {
              return ColoredBox(
                color: Theme.of(context).colorScheme.surface,
                child: Center(child: Text(context.t.errors.imageCouldntload)),
              );
            },
          ),
        ),
        Positioned.fill(
          bottom: NodelabsCaseStudyTheme.homeScreenPadding(context).bottom +
              NodelabsCaseStudyTheme.homeScreenBottomNavbarHeight,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 1),
                        Colors.black.withValues(alpha: 0.1),
                      ],
                    ),
                  ),
                ),
              ),
              // Movie info
              Positioned(
                left: 32,
                right: 32,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.title!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: widget.movie.plot,
                        children: [
                          TextSpan(
                            text: context.t.showMore,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Favorite button
        Positioned(
          right: 16,
          bottom: 250,
          child: FavoriteToggleButton(
            movie: widget.movie,
          ),
        ),
      ],
    );
  }
}
