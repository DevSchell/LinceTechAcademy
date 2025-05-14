import 'dart:io';

import 'package:termo/dicionario.dart';
import 'package:termo/terminal_utils.dart';

void main(List<String> arguments) {
  printBlue("""
------------------------------------------------------------------------------------------------------------------------------------------
                                     
    ██╗     ██╗███╗   ██╗ ██████╗███████╗    ████████╗███████╗ ██████╗██╗  ██╗     █████╗  ██████╗ █████╗ ██████╗ ███████╗███╗   ███╗██╗   ██╗
    ██║     ██║████╗  ██║██╔════╝██╔════╝    ╚══██╔══╝██╔════╝██╔════╝██║  ██║    ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝████╗ ████║╚██╗ ██╔╝
    ██║     ██║██╔██╗ ██║██║     █████╗         ██║   █████╗  ██║     ███████║    ███████║██║     ███████║██║  ██║█████╗  ██╔████╔██║ ╚████╔╝ 
    ██║     ██║██║╚██╗██║██║     ██╔══╝         ██║   ██╔══╝  ██║     ██╔══██║    ██╔══██║██║     ██╔══██║██║  ██║██╔══╝  ██║╚██╔╝██║  ╚██╔╝  
    ███████╗██║██║ ╚████║╚██████╗███████╗       ██║   ███████╗╚██████╗██║  ██║    ██║  ██║╚██████╗██║  ██║██████╔╝███████╗██║ ╚═╝ ██║   ██║   
    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝       ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝     ╚═╝   ╚═╝   
    
------------------------------------------------------------------------------------------------------------------------------------------
""");

  printCyan('Esse arquivo será o ponto de entrada de sua aplicação.');
  print(
    colorizeCyan('Utilize as bibliotecas disponíveis em ') +
        colorizeGrey('/lib ') +
        colorizeCyan('para implementar seu projeto.'),
  );

  print('\nBiblioteca de dicionario (${colorizeGrey('dicionario.dart')})');
  final word = sortearPalavra(); //TODO: Variável que recebe "sortearPalavra()"
  // final word = "passo"; //TODO:testes com passo->basta e vasco->seios

  List<String> wordInList = word.split(""); //word dividida em letras
  print(wordInList);

  int correctLetters = 0;
  int chances = 0;
  bool isOn = true;
  List<String> letrasRepetidas = [];
  for (int i = 0; i < wordInList.length; i++) {
    for (int j = i; j < wordInList.length; j++) {
      if (wordInList[i] == wordInList[j]) {
        letrasRepetidas.add(wordInList[i]);
      }
    }
  }

  do {
    String? userWord = inserirPalavra();  //Recebe palavra do usuário
    List<String>? userWordInList = userWord?.split("");
    correctLetters = 0;
    for (int i = 0; i < wordInList.length; i++) {
      if (userWordInList?[i] == wordInList[i]){
        printGreen("${userWordInList?[i]}");
        correctLetters++;
      } else if (wordInList.contains([i])){ //TODO: aperfeiçoar validação
        printYellow(userWordInList![i]); //TODO: entender pq "!"
      } else {
        printRed(userWordInList![i]); //TODO: entender pq do "!"
      }
      if (correctLetters == 5) {
        print("Parabéns você acertou a palavra!");
        isOn = false;
        return;
      }
      if (chances == 5) {
        print("Sem chances restantes! Que pena! A palavra era $word");
        isOn = false;
        break;
      }
    }
  } while (isOn);
}

String? inserirPalavra() {
  bool isOn = true;
  late String? palavra;

  while (isOn) {
    print("Insira uma palavra de 5 caracteres: ");
     palavra = stdin.readLineSync();
    if (palavra?.length != 5 || palavra == null || palavra == "") {
      print("Palavra possui mais ou menos caracteres do que o esperado! Insira uma palavra com 5 caracteres!");
    } else {
      isOn = false;
    }
  }
  return palavra;
}




