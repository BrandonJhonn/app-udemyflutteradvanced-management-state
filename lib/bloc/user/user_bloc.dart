import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usuario_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc(): super(const UserInitialState()) {

    on<ActivateUser>((event, emit) => emit(UserSetState(event.usuario)));
    
    on<ChangeUserAge>((event, emit) {
      if (!state.existeUsuario) return;
      emit(UserSetState(state.usuario!.copyWith(edad: event.edad)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existeUsuario) return;
      final professions = [...state.usuario!.profesiones, event.profesion];
      emit(UserSetState(state.usuario!.copyWith(profesiones: professions)));
    });

    on<DeleteUser>((event, emit) {
      if (!state.existeUsuario) return;
      emit(const UserInitialState());
    });

  }
}