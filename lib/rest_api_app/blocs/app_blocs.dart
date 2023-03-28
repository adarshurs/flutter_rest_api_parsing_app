import 'package:bloc/bloc.dart';
import 'package:flutter_rest_api/rest_api_app/blocs/app_events.dart';
import 'package:flutter_rest_api/rest_api_app/blocs/app_states.dart';
import 'package:flutter_rest_api/rest_api_app/repo/repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUser();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
  final UserRepository _userRepository;
}
