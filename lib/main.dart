import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/taxi_viewmodel.dart';
import 'view/pantallas/inicio_pantalla.dart';
import 'view/pantallas/taxi_pantalla.dart';
import 'view/pantallas/resultado_pantalla.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaxiViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarifa de Taxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioPantalla(),
        '/principal': (context) => const TaxiPantalla(),
        '/resultado': (context) => const ResultadoPantalla(),
      },
    );
  }
}
