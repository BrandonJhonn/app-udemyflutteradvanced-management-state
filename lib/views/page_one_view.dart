import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/usuario_controller.dart';
import '../models/usuario_model.dart';


class PageOneView extends StatelessWidget {
  const PageOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina Uno'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
        ? InformacionUsuario(usuario: usuarioCtrl.usuario.value)
        : const Center(child: Text('No existe informacion del Usuario'),)
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_circle_up),
        //onPressed: () => Navigator.pushNamed(context, 'page-two'),
        onPressed: () => Get.toNamed('page-two'),
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

          ListTile(title: Text('Nombre: ${ usuario.nombre }'),),
          ListTile(title: Text('Edad: ${ usuario.edad }'),),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ...usuario.profesiones.map((p) => ListTile(
            title: Text(p),
          ))
        ],
      ),
    );
  }
}