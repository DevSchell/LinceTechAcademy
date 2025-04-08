void main() {
  try {
    final String arquivo = "receita.txt";

    ArquivoTexto arquivoTexto = ArquivoTexto(arquivo); //Criando objeto
    arquivoTexto.abrir();
  } catch (e) {
    print("Entrada inválida. Digite um nome válido");
  } finally {
    print("Fim do programa");
  }
}

// TODO: Preciso finalizar essa atividade, por favor não considerá-la como concluída(Só em últimos casos)

abstract class Arquivo {
  abrir();
}

class ArquivoTexto implements Arquivo {
 final String _nome;

  ArquivoTexto(this._nome){ } //Construtor usando "this._nome" pra jogar o parâmetro na variável _nome

  @override
  abrir() {
    try {
      throw Exception("Erro ao abrir o arquivo $_nome");
    } catch (e){
      rethrow;
    }
  }
}