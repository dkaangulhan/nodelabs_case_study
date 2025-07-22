part of 'user_card_bloc.dart';

sealed class UserCardState extends Equatable {
  const UserCardState();

  @override
  List<Object> get props => [];
}

final class UserNotLoaded extends UserCardState {}

final class UserLoaded extends UserCardState {
  const UserLoaded({
    required this.user,
  });

  final User user;

  @override
  List<Object> get props => [user];
}
