import 'dart:math';

enum fornecedores {
  FornecedorDeBebidas(),
  FornecedorDeSanduiches(),
  FornecedorDeBolos(),
  FornecedorDeSaladas(),
  FornecedorDeUltraCaloricos(),
  FornecedorDePetiscos(),
}

void main() {
  final pessoa = Pessoa();
  final fornecedor = FornecedorDeBebidas();

  // Consumindo produtos fornecidos
  for (var i = 0; i < 5; i++) {
    pessoa.refeicao(fornecedor);
  }

  pessoa.informacoes();
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

class FornecedorDeUltraCaloricos extends Fornecedor {
  final _random = Random();
  final _ultraCaloricosDisponiveis = <Produto>[
    Produto('Pizza', 800),
    Produto('Hambúrguer', 700),
    Produto('Batata Frita com Bacon', 600),
    Produto('Bolo de Chocolate com Cobertura', 500),
    Produto('Milkshake de Chocolate', 500),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _ultraCaloricosDisponiveis[_random.nextInt(_ultraCaloricosDisponiveis.length)];
  }
}

class FornecedorDePetiscos extends Fornecedor {
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto('Pipoca', 380),
    Produto('Batata Frita', 300),
    Produto('Amendoim Torrado', 170),
    Produto('Bruschetta de Tomate e Manjericão', 250),
    Produto('Mini Sanduíches', 150),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
}

class FornecedorDeSanduiches extends Fornecedor {
  final _random = Random();
  final _sanduichesDisponiveis = <Produto>[
    Produto('Sanduíche de Frango Grelhado', 350),
    Produto('Sanduíche de Atum', 320),
    Produto('Sanduíche Vegatariano', 280),
    Produto('Sanduíche de Presunto', 300),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _sanduichesDisponiveis[_random.nextInt(_sanduichesDisponiveis.length)];
  }
}

class FornecedorDeSaladas extends Fornecedor {
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto('Salada de Folhas Verdes', 20),
    Produto('Salada de Frango Grelhado', 250),
    Produto('Salada de Atum', 280),
    Produto('Salada Caprese', 300),
    Produto('Salada de Quinoa com Legumes', 320),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
}

class FornecedorDeBolos extends Fornecedor {
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto('Bolo de chocolate', 350),
    Produto('Bolo de Cenoura', 280),
    Produto('Bolo de Laranja', 250),
    Produto('Bolo de Fubá', 300),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }
}

class FornecedorDeBebidas extends Fornecedor {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

abstract class Fornecedor {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class Pessoa {
  // Acumulador de calorias
  int _caloriasConsumidas = 0;

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');
  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao(FornecedorDeBebidas fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
  }
}