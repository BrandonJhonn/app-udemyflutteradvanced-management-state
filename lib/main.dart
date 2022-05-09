import 'package:app_workspace_singleton/views/page_one_view.dart';
import 'package:app_workspace_singleton/views/page_two_view.dart';
import 'package:flutter/material.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      initialRoute: 'page-one',
      routes: {
        'page-one': (_) => const PageOneView(),
        'page-two': (_) => const PageTwoView(),
      },
    );
  }
}