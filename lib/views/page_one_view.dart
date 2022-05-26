import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/usuario/usuario_cubit.dart';
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
            onPressed: () => context.read<UsuarioCubit>().deleteUsuario(), 
            icon: const Icon(Icons.delete)
          )
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_circle_up),
        onPressed: () => Navigator.pushNamed(context, 'page-two'),
      ),
   );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) { 

        switch(state.runtimeType) {
          case UsuarioInitial:
            return const Center(child: Text('No existe informacion de Usuario'));
          case UsuarioActivo:
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
          default:
            return Center(child: Container(),);
        }

        // if (state is UsuarioInitial) {
        //   return const Center(child: Text('No existe informacion de usuario'),);
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(usuario: state.usuario,);
        // } else {
        //   return Container();
        // }
      },);
  }
}

class InformacionUsuario extends StatelessWidget {
  final UsuarioModel usuario;

  const InformacionUsuario({
    Key? key,
    required this.usuario
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

          ...usuario.profesiones.map((e) => ListTile(
            title: Text(e),
          )).toList()
        ],
      ),
    );
  }
}