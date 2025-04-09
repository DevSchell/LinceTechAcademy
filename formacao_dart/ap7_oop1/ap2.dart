import 'dart:math';

void main(){
  Retangulo retangulo = new Retangulo(
      Random().nextDouble() * 99,
      Random().nextDouble() * 99);

  print("Área do retângulo: ${retangulo.calcularArea()}");

}

class Retangulo {
  late final _largura;
  late final _altura;

  Retangulo(double altura, double largura){
    try {
      this._altura = altura;
      this._largura = largura;
    } catch (e){
      print(e); //Printa a Exception lançada
    }
  }


  double calcularArea() => _largura * _altura;

}