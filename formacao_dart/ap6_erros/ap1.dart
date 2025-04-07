void main() {
  String texto = "teste";
  converterString(texto);
}

void converterString(String valor) {
  int resultado;

  try {
    resultado = int.parse(valor);
    print("Valor digitado: $resultado");
  } catch (e) {
    print("Entrada inválida. Insira apenas números inteiros");
  }
}
