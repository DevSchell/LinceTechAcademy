void main() {
  Map<String, int?> tabelaPessoas = {
    "Nelson": null,
    "Jane": null,
    "Jack": 16,
    "Rupert": 37,
    "Andy": 13,
    "Kim": 27,
    "Robert": 31,
  };

  for (var chave in tabelaPessoas.keys) {
    print("$chave - ${tabelaPessoas[chave] == null ? "Idade não informada" : tabelaPessoas[chave]}");
  }
}
