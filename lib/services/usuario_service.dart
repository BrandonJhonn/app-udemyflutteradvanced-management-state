import 'package:flutter/material.dart';
import 'package:app_workspace_singleton/models/usuario_model.dart';

class UsuarioService with ChangeNotifier {
  UsuarioModel _usuario = UsuarioModel(
    nombre: '', 
    edad: 0, 
    profesiones: []
  );

  //  Getters
  UsuarioModel get usuario => _usuario;
  bool get existeUsuario => _usuario.nombre != '' ? true : false;

  //  Setters
  set usuario (UsuarioModel us) {
    _usuario = us;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void eliminarUsuario() {
    _usuario = UsuarioModel(nombre: '', edad: 0, profesiones: []);
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario.profesiones.add('Profesion ${_usuario.profesiones.length + 1}');
    notifyListeners();
  }
}