import 'dart:math';

void main() {
  final random = Random();
  Retangulo r = new Retangulo(
      random.nextDouble() * 99,
      random.nextDouble() * 99
  );

  print("Area do retângulo: ${r.calcularArea()}");

}

abstract class Forma {
  calcularArea();
}

class Retangulo implements Forma {
  late final double _base;
  late final double _altura;

  Retangulo(double base, double altura) { // Método construtor
    _base = base;
    _altura = altura;

    if (_base <= 0 || _altura <= 0) {
      throw Exception("Dimensões inválidas. informa apenas valores positivos maiores que zero");
    }
  }

  @override
  calcularArea() {
    try {
    return _base * _altura;
    } catch (e){
      print(e);
    }
  }
}