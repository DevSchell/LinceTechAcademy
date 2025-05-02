void main() {
  List<int> listaNumeros = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];

  int resultado = somarComMetodo(listaNumeros);
  print(resultado);
}

int somarComMetodo(List<int> lista) => lista.reduce((a, b) => a + b);

int somarComRecursao(List<int> numeros) {
  if (numeros.isEmpty) return 0;
  return numeros.first + somarComRecursao(numeros.sublist(1));
}

int somarComWhile(List<int> lista) {
  int contador = 0;
  int resultado = 0;

  while(contador < lista.length){
    resultado += lista[contador];
    contador++;
  }

  return resultado;
}

int somarComFor(List<int> lista) {
  int resultadoFinal = 0;

  for(int i = 0; i < lista.length; i++) {
    resultadoFinal += lista[i];
  }

  return resultadoFinal;
}