import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';
import '../models/usuario_model.dart';


class PageTwoView extends StatelessWidget {
  const PageTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioBloc = BlocProvider.of<UserBloc>(context, listen: false);

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
                final usuario = UsuarioModel(
                  nombre: 'Brandon', 
                  edad: 28, 
                  profesiones: ['Ingeniero', 'Desarrollador']
                );

                //BlocProvider.of<UserBloc>(context, listen: false).add(ActivateUser(usuario));
                usuarioBloc.add(ActivateUser(usuario));
              },
            ),
            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(ChangeUserAge(30));
              },
            ),
            MaterialButton(
              child: const Text('Agregar Profesion', style: TextStyle(color: Colors.white,)),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(AddProfession('Nueva Profesion'));
              },
            ),
          ],
        ),
      ),
   );
  }
}