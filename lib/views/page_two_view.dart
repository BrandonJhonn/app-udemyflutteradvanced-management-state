import 'package:app_workspace_singleton/models/usuario_model.dart';
import 'package:app_workspace_singleton/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PageTwoView extends StatelessWidget {
  const PageTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
        ? Text('Nombre: ${usuarioService.usuario.nombre}')
        : const Text('Pagina Dos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.usuario = UsuarioModel(
                  nombre: 'Jose', 
                  edad: 40, 
                  profesiones: []
                );
              },
            ),
            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () => usuarioService.cambiarEdad(25),
            ),
            MaterialButton(
              child: const Text('Agregar Profesion', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () => usuarioService.agregarProfesion(),
            ),
          ],
        ),
      ),
   );
  }
}