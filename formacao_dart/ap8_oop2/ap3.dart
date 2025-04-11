void main() {

  Pinscher cachorro = new Pinscher("Bob");
  cachorro.dormir();
  cachorro.latir();

}

//Classe abstrata 1
abstract class Animal {
  late final String _nome;
  //Method abastrato 1
  void dormir() =>  print("$_nome está dormindo.");
}

//Classe abstrata 2
abstract class Cachorro extends Animal {
  //Method abstrato 2
  void latir() => print("$_nome está latindo.");
}

//Classe concreta
class Pinscher extends Cachorro{
  Pinscher(String nome){
    _nome = nome;
  }
}