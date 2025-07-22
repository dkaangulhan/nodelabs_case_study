part of 'feed_bloc.dart';

class FeedState extends Equatable {
  const FeedState({
    required this.movies,
    required this.currentPage,
    required this.totalCount,
    required this.maxPage,
  });

  final List<Movie> movies;
  final int? currentPage;
  final int? totalCount;
  final int? maxPage;

  @override
  List<Object?> get props => [movies, currentPage, totalCount, maxPage];

  FeedState copyWith({
    List<Movie>? movies,
    int? currentPage,
    int? totalCount,
    int? maxPage,
  }) {
    return FeedState(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalCount: totalCount ?? this.totalCount,
      maxPage: maxPage ?? this.maxPage,
    );
  }
}

class FeedLoading extends FeedState {
  const FeedLoading({
    required super.movies,
    required this.loadingPage,
    required super.currentPage,
    required super.totalCount,
    required super.maxPage,
  });

  final int loadingPage;

  @override
  List<Object?> get props => [
        movies,
        currentPage,
        totalCount,
        loadingPage,
        maxPage,
      ];
}
