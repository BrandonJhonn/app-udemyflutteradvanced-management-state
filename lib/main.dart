import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/usuario_service.dart';
import '../views/page_one_view.dart';
import '../views/page_two_view.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        initialRoute: 'page-one',
        routes: {
          'page-one': (_) => const PageOneView(),
          'page-two': (_) => const PageTwoView(),
        },
      ),
    );
  }
}