class TaxiModel {
  final double kilometros;
  final String horario;
  final double tarifaBase;
  final double costoKilometros;
  final double costoRecorrido;
  final double porcentajeRecargo;
  final double recargo;
  final double totalPagar;

  // Constructor
  TaxiModel({
    required this.kilometros,
    required this.horario,
    required this.tarifaBase,
    required this.costoKilometros,
    required this.costoRecorrido,
    required this.porcentajeRecargo,
    required this.recargo,
    required this.totalPagar,
  });
}
