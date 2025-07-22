import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'user_card_event.dart';
part 'user_card_state.dart';

class UserCardBloc extends Bloc<UserCardEvent, UserCardState> {
  UserCardBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(UserNotLoaded()) {
    on<LoadUser>(_onLoadUser);
  }

  FutureOr<void> _onLoadUser(
    LoadUser event,
    Emitter<UserCardState> emit,
  ) async {
    final user = _userRepository.user;
    if (user != null) {
      return emit(UserLoaded(user: _userRepository.user!));
    }
    emit(UserNotLoaded());
  }

  final UserRepository _userRepository;
}
