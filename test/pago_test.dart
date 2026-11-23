import 'package:flutter_test/flutter_test.dart';
import 'package:cuenta_clara/models/pago.dart';
import 'package:cuenta_clara/utils/formato.dart';

void main() {
  test('copyWith cambia estado y conserva el mismo identificador', () {
    final original = Pago(
      id: 'abc',
      concepto: 'Internet',
      categoria: CategoriaPago.servicios,
      monto: 110000,
      fechaVencimiento: DateTime(2026, 10, 22),
      pagado: false,
      nota: '',
      responsable: 'Yo',
    );
    final nuevo = original.copyWith(pagado: true);
    expect(nuevo.id, 'abc');
    expect(nuevo.pagado, true);
    expect(original.pagado, false); // Inmutabilidad.
  });

  test('copyWith permite editar el responsable', () {
    final original = Pago(
      id: 'abc',
      concepto: 'Internet',
      categoria: CategoriaPago.servicios,
      monto: 110000,
      fechaVencimiento: DateTime(2026, 10, 22),
      pagado: false,
      nota: '',
      responsable: 'Mamá',
    );
    final nuevo = original.copyWith(responsable: 'Papá');
    expect(nuevo.responsable, 'Papá');
    expect(original.responsable, 'Mamá');
    expect(nuevo.id, 'abc');
  });

  test('formatearPesos utiliza separadores de miles', () {
    expect(formatearPesos(1250000), '\$1.250.000');
    expect(formatearPesos(0), '\$0');
  });
}
