import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:andres_cardenas_examen_p1/main.dart';
import 'package:andres_cardenas_examen_p1/view_model/taxi_viewmodel.dart';

void main() {
  testWidgets('Carga inicial de la pantalla de inicio', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaxiViewModel(),
        child: const MyApp(),
      ),
    );

    expect(find.text('Cooperativa de Taxis'), findsOneWidget);
    expect(find.text('Iniciar Carrera'), findsOneWidget);
  });
}
