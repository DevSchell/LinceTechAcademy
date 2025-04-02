import 'dart:math';

void main() {
  final random = Random();
  final opcao = random.nextInt(6);  
  
  //Refatoração do aninhamento de IFs com switch/case
  switch (opcao) {

    case 1:
      print('Encontrado 1');
      break;

    case 2:
      print('Encontrado 2');
      break;

    case 3:
    print('Encontrado 3');
      break;

    case 4:
    print('Encontrado 4');
      break;

    case 5:
      print('Encontrado final');
      break;
    
    case 6:
      break;
    
    default: 
      print('Opcao invalida');
  }
}
