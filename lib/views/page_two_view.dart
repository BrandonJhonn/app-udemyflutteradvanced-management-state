import 'package:flutter/material.dart';

import '../models/usuario_model.dart';
import '../services/usuario_service.dart';


class PageTwoView extends StatelessWidget {
  const PageTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<UsuarioModel> snapshot){
            return (snapshot.hasData)
            ? Text('Nombre: ${snapshot.data!.nombre}')
            : const Text('Pagina Dos');
          }
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: (){
                usuarioService.cargarUsuario(UsuarioModel(
                  nombre: 'Samuel', 
                  edad: 30, 
                  profesiones: []
                ));
              },
            ),
            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: (){
                usuarioService.cambiarEdad(20);
              },
            ),
            MaterialButton(
              child: const Text('Agregar Profesion', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: (){},
            ),
          ],
        ),
      ),
   );
  }
}