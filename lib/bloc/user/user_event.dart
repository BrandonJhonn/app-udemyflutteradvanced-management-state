part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final UsuarioModel usuario;
  ActivateUser(this.usuario);
}

class ChangeUserAge extends UserEvent {
  final int edad;
  ChangeUserAge(this.edad);
}

class AddProfession extends UserEvent {
  final String profesion;
  AddProfession(this.profesion);
}

class DeleteUser extends UserEvent {}