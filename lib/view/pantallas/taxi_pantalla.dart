import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/taxi_viewmodel.dart';
import '../widgets/campo_numero.dart';
import '../widgets/option_button.dart';

class TaxiPantalla extends StatefulWidget {
  const TaxiPantalla({super.key});

  @override
  State<StatefulWidget> createState() => _TaxiPantallaState();
}

class _TaxiPantallaState extends State<TaxiPantalla> {
  // Mapeo
  final kmController = TextEditingController();
  String? errorTexto;

  void calcular() {
    String texto = kmController.text.trim();
    if (texto.isEmpty) {
      setState(() {
        errorTexto = 'Ingrese los kilómetros';
      });
      return;
    }

    double? kilometros = double.tryParse(texto);
    if (kilometros == null || kilometros < 0) {
      setState(() {
        errorTexto = 'No se permiten números negativos';
      });
      return;
    }

    setState(() {
      errorTexto = null;
    });

    // Recibir a View Model
    final vm = context.read<TaxiViewModel>();
    final resultado = vm.calcular(kilometros);

    // Paso de parametros
    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaxiViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Carrera'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CampoNumero(
                etiqueta: 'Kilómetros recorridos',
                controller: kmController,
                errorTexto: errorTexto,
              ),
              const SizedBox(height: 15),
              const Text(
                'Horario del Viaje',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              OptionButton(
                titulo: 'Diurno (Día)',
                valor: 'Día',
                seleccionado: vm.horarioSeleccionado,
                onChanged: (valor) => vm.seleccionarHorario(valor!),
              ),
              OptionButton(
                titulo: 'Nocturno (Noche)',
                valor: 'Noche',
                seleccionado: vm.horarioSeleccionado,
                onChanged: (valor) => vm.seleccionarHorario(valor!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: calcular,
                child: const Text('Calcular Tarifa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
