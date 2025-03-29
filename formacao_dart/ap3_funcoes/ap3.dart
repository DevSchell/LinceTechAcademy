import 'dart:math';

void main() {
  //Criando lista
  List<double> listaRaios = [];

  //Povoando lista
  while (listaRaios.length < 10) {
    listaRaios.add(Random().nextDouble() * 100);
  }

  double calcularArea(double raio) {
    return pow(raio, 2) * 3.14;
  }

  double calcularPerimetro(double raio) =>
      2 * 3.14 * raio; //Experimentando escrever função de outra forma

  for (var i = 0; i < listaRaios.length; i++) {
    print("Raio: ${listaRaios[i]}, area: ${calcularArea(listaRaios[i])}, perímetro: ${calcularPerimetro(listaRaios[i])}");
  }
}
