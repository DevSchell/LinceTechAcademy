void main(){
  Tartaruga donatello = new Tartaruga();

  donatello.comer();
  donatello.beber();
  donatello.estaNoCasco();

}

abstract class Animal {
  
  void comer() {
    print("O animal está comendo.");
  }
  
  void beber() {
    print("O animal está bebendo.");
  }
  
}

class Tartaruga extends Animal {
  bool noCasco = false;

  void estaNoCasco() {
    if (noCasco) {
      print("Tartaruga está dentro do casco");
    } else {
      print("Tartaruga está fora do casco");
    }
  }

  bool entrarCasco(Tartaruga tartaruga) => tartaruga.noCasco = true;
  bool sairCasco(Tartaruga tartaruga) => tartaruga.noCasco = false;

}