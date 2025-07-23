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
    on<UserUpdated>(_onUserUpdated);
    _userUpdateSubscription = _userRepository.userUpdateStream.listen(
      _onUserRepositoryUpdated,
    );
  }

  final UserRepository _userRepository;

  late final StreamSubscription<UserUpdateEvent> _userUpdateSubscription;

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

  FutureOr<void> _onUserUpdated(
    UserUpdated event,
    Emitter<UserCardState> emit,
  ) {
    emit(UserLoaded(user: _userRepository.user!));
  }

  void _onUserRepositoryUpdated(UserUpdateEvent event) {
    add(UserUpdated());
  }

  @override
  Future<void> close() async {
    await _userUpdateSubscription.cancel();
    return super.close();
  }
}
