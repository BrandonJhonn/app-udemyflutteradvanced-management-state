import 'dart:async';

import '../models/usuario_model.dart';

class _UsuarioService {
  UsuarioModel _usuario = UsuarioModel(
    nombre: '', 
    edad: 0, 
    profesiones: []
  );

  final StreamController<UsuarioModel> _usuarioStreamController = StreamController.broadcast();

  UsuarioModel get usuario => _usuario;
  bool get existeUsuario => (_usuario.nombre != '') ? true : false;

  Stream<UsuarioModel> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(UsuarioModel us) {
    _usuario = us;
    _usuarioStreamController.add(us);
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    _usuarioStreamController.add(_usuario);
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
