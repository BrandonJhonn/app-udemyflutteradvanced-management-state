import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';
import '../models/usuario_model.dart';


class PageOneView extends StatelessWidget {
  const PageOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina Uno'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
              .add(DeleteUser());
            }, 
            icon: const Icon(Icons.delete_outline)
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {

          return state.existeUsuario 
          ? InformacionUsuario(usuario: state.usuario!,)
          : const Center(
            child: Text('No existe informacion de Usuario'),
          );
        },
      ),
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

          ListTile(title: Text('Nombre: ${ usuario.nombre }'),),
          ListTile(title: Text('Edad: ${ usuario.edad }'),),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ...usuario.profesiones.map(
            (p) => ListTile(title: Text(p),)
          ).toList()
        ],
      ),
    );
  }
}