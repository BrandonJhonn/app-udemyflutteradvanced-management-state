import 'package:app_workspace_singleton/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/usuario_service.dart';


class PageOneView extends StatelessWidget {
  const PageOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina Uno'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_rounded),
            onPressed: () => usuarioService.eliminarUsuario(), 
          )
        ],
      ),
      body: usuarioService.existeUsuario
      ? InformacionUsuario(usuario: usuarioService.usuario,)
      : const Center(child: Text('No existe informacion de usuario'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_circle_up),
        onPressed: () => Navigator.pushNamed(context, 'page-two'),
      ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {
  final UsuarioModel usuario;
  
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ListTile(title: Text('Nombre: ${usuario.nombre}'),),
          ListTile(title: Text('Edad: ${usuario.edad}'),),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ...usuario.profesiones
          .map((p) => ListTile(title: Text(p),))
          .toList()
          // const ListTile(title: Text('Profesion 1'),),
        ],
      ),
    );
  }
}