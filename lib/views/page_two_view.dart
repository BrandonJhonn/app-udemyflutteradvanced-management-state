import 'package:app_workspace_singleton/bloc/usuario/usuario_cubit.dart';
import 'package:app_workspace_singleton/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PageTwoView extends StatelessWidget {
  const PageTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

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
                final UsuarioModel usuario = UsuarioModel(
                  nombre: 'David', 
                  edad: 25, 
                  profesiones: [
                    'Developer',
                    'DBA'
                  ]
                );
                usuarioCubit.getUsuarioActivo(usuario);
              },
            ),
            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.updateEdad(30);
              },
            ),
            MaterialButton(
              child: const Text('Agregar Profesion', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.addProfesion();
              },
            ),
          ],
        ),
      ),
   );
  }
}