part of 'favorite_toggle_button_cubit.dart';

class FavoriteToggleButtonState extends Equatable {
  const FavoriteToggleButtonState({
    required this.movie,
  });

  final Movie movie;

  @override
  List<Object> get props => [movie];

  FavoriteToggleButtonState copyWith({
    Movie? movie,
  }) {
    return FavoriteToggleButtonState(
      movie: movie ?? this.movie,
    );
  }
}
