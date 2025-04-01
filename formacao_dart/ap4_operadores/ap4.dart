void main() {
  int precoOriginal = 10;
  int precoComDesconto = 7;
  print(
    "O produto custava $precoOriginal reais, foi vendido por $precoComDesconto reais. O desconto foi de ${percentualDesconto(precoOriginal, precoComDesconto)}%",
  );
}

int percentualDesconto(int precoOriginal, int precoVenda) {
  int desconto = 100 * (precoOriginal - precoVenda) ~/ precoOriginal;
  return desconto;
}
