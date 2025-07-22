part of 'feed_bloc.dart';

sealed class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class RequestNextPage extends FeedEvent {
  const RequestNextPage();
  @override
  List<Object> get props => [];
}
