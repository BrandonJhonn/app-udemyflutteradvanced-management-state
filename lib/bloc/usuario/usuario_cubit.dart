import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usuario_model.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {

  UsuarioCubit() : super(UsuarioInitial());

  void getUsuarioActivo(UsuarioModel us) {
    emit(UsuarioActivo(us));
  }
  void updateEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void addProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      List<String> lst = currentState.usuario.profesiones;
      lst.add('Profesion ${lst.length + 1}');
      final newUser = currentState.usuario.copyWith(profesiones: lst);
      emit(UsuarioActivo(newUser));
    }
  }

  void deleteUsuario() {
    emit(UsuarioInitial());
  }
}