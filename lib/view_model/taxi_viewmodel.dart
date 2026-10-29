import 'package:flutter/material.dart';
import '../model/taxi_model.dart';

class TaxiViewModel extends ChangeNotifier {
  String horarioSeleccionado = 'Día';

  void seleccionarHorario(String horario) {
    horarioSeleccionado = horario;
    notifyListeners();
  }

  TaxiModel calcular(double kilometros) {
    if (kilometros < 0) {
      kilometros = 0;
    }

    const double tarifaBase = 1.50;
    const double costoPorKm = 0.60;

    double costoKilometros = kilometros * costoPorKm;
    double costoRecorrido = tarifaBase + costoKilometros;

    double porcentajeRecargo = (horarioSeleccionado == 'Noche') ? 0.20 : 0.0;
    double recargo = costoRecorrido * porcentajeRecargo;
    double totalPagar = costoRecorrido + recargo;

    return TaxiModel(
      kilometros: kilometros,
      horario: horarioSeleccionado,
      tarifaBase: tarifaBase,
      costoKilometros: costoKilometros,
      costoRecorrido: costoRecorrido,
      porcentajeRecargo: porcentajeRecargo,
      recargo: recargo,
      totalPagar: totalPagar,
    );
  }
}
