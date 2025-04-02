void main() {
  final listaNomes = [
    "Joao",
    "Maria",
    "Pedro",
    "Maria",
    "Ana",
    "Joao",
    "Maria",
    "Fernanda",
    "Carlos",
    "Maria",
  ];

  final nome = 'Ana';
  final quantidade = contarNome(listaNomes, nome);

  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome nao foi encontrado');
  }
}

//Função requisitada
int contarNome(List<String> lista, String nome) {
  int numRepeticoes = 0;

  for (var element in lista) {
    if (element == nome) { //Se nome é igual ao parâmetro, incrementa o contador
      numRepeticoes++;
    }
  }

  return numRepeticoes;
}
