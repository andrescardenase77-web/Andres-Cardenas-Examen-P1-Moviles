import 'package:flutter/material.dart';

class CampoNumero extends StatelessWidget {
  final String etiqueta;
  final TextEditingController controller;
  final String? errorTexto;

  const CampoNumero({
    super.key,
    required this.etiqueta,
    required this.controller,
    this.errorTexto,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
      decoration: InputDecoration(
        labelText: etiqueta,
        border: const OutlineInputBorder(),
        errorText: errorTexto,
      ),
    );
  }
}
