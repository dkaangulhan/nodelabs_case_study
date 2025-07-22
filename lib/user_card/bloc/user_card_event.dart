part of 'user_card_bloc.dart';

sealed class UserCardEvent extends Equatable {
  const UserCardEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserCardEvent {}
