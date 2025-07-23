import 'package:analytics_repository/analytics_repository.dart';

sealed class AppAnalyticsEvent extends AnalyticsEvent {
  const AppAnalyticsEvent();
}

class MovieLikedAnalyticsEvent extends AppAnalyticsEvent {
  const MovieLikedAnalyticsEvent({
    required this.movieName,
    required this.userId,
  });

  final String movieName;
  final String userId;

  @override
  String get eventName => 'Movie Liked';

  @override
  Map<String, String>? properties() {
    return {
      'movieName': movieName,
      'userId': userId,
    };
  }
}
