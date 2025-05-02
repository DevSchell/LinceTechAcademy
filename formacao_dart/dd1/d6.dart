void main() {
  List<int> listaInteiros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];
  listaInteiros.sort();

  for (int numero in listaInteiros){
    String binario = numero.toRadixString(2);
    String octal = numero.toRadixString(8);
    String hexa = numero.toRadixString(16);

    print("decimal: $numero, binário: $binario, octal: $octal, hexadecimal: $hexa");
  }

}
