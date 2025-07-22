import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/feed/bloc/feed_bloc.dart';
import 'package:nodelabs_case_study/feed/view/movie_poster.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return FeedBloc(
          movieRepository: context.read<MovieRepository>(),
        )..add(const RequestNextPage());
      },
      child: const FeedPageContent(),
    );
  }
}

class FeedPageContent extends StatefulWidget {
  const FeedPageContent({super.key});

  @override
  State<FeedPageContent> createState() => _FeedPageContentState();
}

class _FeedPageContentState extends State<FeedPageContent> {
  final _pageKey = GlobalKey();
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageMove);
  }

  void _onPageMove() {
    final maxPage = context.read<FeedBloc>().state.movies.length -
        1; // Total pages minus one
    final currentPage = _pageController.page;

    if (currentPage != null &&
        currentPage >= maxPage &&
        _pageController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        !_pageController.position.outOfRange) {
      context.read<FeedBloc>().add(const RequestNextPage());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          return Stack(
            children: [
              // Page View
              RefreshIndicator.adaptive(
                onRefresh: () async {
                  context.read<FeedBloc>().add(const RefreshMovies());
                  unawaited(
                    _pageController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInCubic,
                    ),
                  );
                },
                child: Positioned.fill(
                  child: PageView.builder(
                    key: _pageKey,
                    clipBehavior: Clip.none,
                    controller: _pageController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return MoviePoster(movie: state.movies[index]);
                    },
                  ),
                ),
              ),
              if (state is FeedLoading)
                const Positioned(
                  left: 0,
                  right: 0,
                  top: 40,
                  child: SafeArea(
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
