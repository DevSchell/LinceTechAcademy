import 'dart:math';

void main() {

  int indexAleatorio = Random().nextInt(7);
  
  print("Meu gênero musical preferido e o ${GeneroMusical.values[indexAleatorio].name}");
  
}

enum GeneroMusical {
  forro,
  pagode,
  samba,
  jazz,
  rock,
  blues,
  gospel,
  eletronica,
}