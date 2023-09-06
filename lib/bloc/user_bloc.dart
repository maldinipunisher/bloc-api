import 'package:bloc/bloc.dart';
import 'package:bloc_api/models/user.dart';
import 'package:bloc_api/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository ; 

  UserBloc(this._userRepository) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if(event is LoadUser) {
        try {
          emit(UserLoaded(await _userRepository.getSingleUser(event.id))); 
        } catch (e) {
          emit(UserError(e.toString()));
        }
      }
    });
  }
}
