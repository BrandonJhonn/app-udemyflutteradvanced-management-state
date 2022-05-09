import 'package:flutter/material.dart';

import '../models/usuario_model.dart';
import '../services/usuario_service.dart';


class PageOneView extends StatelessWidget {
  const PageOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina Uno'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<UsuarioModel> snapshot){
          return (snapshot.hasData) 
          ? InformacionUsuario(us: snapshot.data)
          : const Center(child: Text('No hay informacion del usuario'),);
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_circle_up),
        onPressed: () => Navigator.pushNamed(context, 'page-two'),
      ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {
  final UsuarioModel? us;
  const InformacionUsuario({
    Key? key,
    this.us,
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

          ListTile(title: Text('Nombre: ${ us?.nombre }'),),
          ListTile(title: Text('Edad: ${ us?.edad }'),),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          const ListTile(title: Text('Profesion 1'),),
          const ListTile(title: Text('Profesion 2'),),
          const ListTile(title: Text('Profesion 3'),),
        ],
      ),
    );
  }
}