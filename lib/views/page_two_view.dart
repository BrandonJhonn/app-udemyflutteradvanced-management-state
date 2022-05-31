import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/usuario_controller.dart';
import '../models/usuario_model.dart';


class PageTwoView extends StatelessWidget {
  const PageTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina Dos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cargarUsuario(UsuarioModel(
                  nombre: 'Brandon',
                  edad: 25
                ));
                Get.snackbar(
                  'Correcto!', 
                  'Usuario establecido correctamente',
                  backgroundColor: Colors.white,
                  boxShadows: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              },
            ),
            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(30);
              },
            ),
            MaterialButton(
              child: const Text('Agregar Profesion', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                //usuarioCtrl.agregarProfesion('Profesion #${ usuarioCtrl.usuario.value.profesiones.length + 1 }');
                usuarioCtrl.agregarProfesion('Profesion #${ usuarioCtrl.profesionesCount + 1 }');
              },
            ),
            MaterialButton(
              child: const Text('Cambiar Tema', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
            ),
          ],
        ),
      ),
   );
  }
}