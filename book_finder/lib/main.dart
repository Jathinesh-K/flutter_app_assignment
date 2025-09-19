import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';
import 'routing/routing.dart';

void main() async {
  runApp(MultiProvider(providers: providers, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      routerConfig: router,
    );
  }
}
