import 'dart:math';

void main() {
  List<double> raios = [5, 8, 12, 7.3, 18, 2, 25];

  for (int i = 0; i < raios.length; i++){
    print(calcularPerimetro(raios[i]).toStringAsFixed(2));
  }

}

double calcularPerimetro(double raio) {
 double resultado = (2 * 3.14) * raio;
 return resultado;
}