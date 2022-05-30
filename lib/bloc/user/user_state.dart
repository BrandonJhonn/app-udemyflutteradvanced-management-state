part of 'user_bloc.dart';

@immutable
abstract class UserState {

  final bool existeUsuario;
  final UsuarioModel? usuario;

  const UserState({
    this.existeUsuario = false, 
    this.usuario
  });

}

class UserInitialState extends UserState {
  const UserInitialState(): super(existeUsuario: false, usuario: null);
}

class UserSetState extends UserState {
  final UsuarioModel nuevoUsuario;
  const UserSetState(this.nuevoUsuario)
  :super (existeUsuario: true, usuario: nuevoUsuario);
}