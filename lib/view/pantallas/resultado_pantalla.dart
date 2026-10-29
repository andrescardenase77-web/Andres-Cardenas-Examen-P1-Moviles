import 'package:flutter/material.dart';

import '../../model/taxi_model.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final taxi = ModalRoute.of(context)!.settings.arguments as TaxiModel;

    Widget dato(String titulo, String valor) {
      return ListTile(
        title: Text(titulo),
        subtitle: Text(
          valor,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado de la Carrera'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    dato('Tarifa Base', '\$${taxi.tarifaBase.toStringAsFixed(2)}'),
                    dato('Kilómetros Recorridos', '${taxi.kilometros.toStringAsFixed(2)} km'),
                    dato('Horario del Viaje', taxi.horario),
                    dato('Costo del Recorrido', '\$${taxi.costoRecorrido.toStringAsFixed(2)}'),
                    dato('Recargo Nocturno (20%)', '\$${taxi.recargo.toStringAsFixed(2)}'),
                    dato('Total a Pagar', '\$${taxi.totalPagar.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Nueva Carrera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
