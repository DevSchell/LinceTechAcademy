import 'dart:convert';
import 'dart:io';

void main() async{
    bool isRunning = true;
    while(isRunning){
      print("Olá, Leandro. Que relatório você precisa?");
      print("1 - Temperatura");
      print("2 - Umidade");
      print("3 - Direção do vento");
      print("4 - Sair do programa");
      print("Digite o número da opção desejada: ");
      String? opt = stdin.readLineSync();

      switch (opt){
        case "1":
          break;

        case "2":
          late String userPath;
          print("De qual estado você quer tirar o relatório?");
          print("1 - São Paulo");
          print("2 - Santa Catarina");
          dynamic option = stdin.readLineSync();
            if (option == "1") {
              userPath = "SP";
            } else if (option == "2") {
              userPath = "SC";
            } else {
              print("Por favor insira uma opção válida. 1 ou 2");
              return;
            }
            List<DataLine> lista = await gerarListaObj(userPath);
             print(await getTempMedEstadoMes(lista));
          break;

        case "3":
          break;

        case "4":
          print("... FIM ...");
          isRunning = false;
          break;

        default: print("Opção inválida. Por favor insira apenas um dos numerias referentes às escolhas do menu.");
        stdin.readLineSync();
          break;
      }
    }
}

Future<double> getTempMedEstadoMes(List<DataLine> listaDeObj) async {
  double media = 0;
  for (DataLine obj in listaDeObj) {
    media += obj.temperatura;
  }
  media = media / listaDeObj.length;
  return media;
}

Future<List<DataLine>> gerarListaObj(String userPath) async {
  List<String> lista = await lerArquivoCSV(userPath);
  List<DataLine> listaObjetos = [];
  for (int i = 1; i < lista.length; i++) { //Index começa em 1, pra pular o header da tabela de dados
    var obj = gerarObj(userPath, i);
    listaObjetos.add(await obj);
  }
  return listaObjetos;
}

//Retorna cada linha como uma string dentro de uma lista
Future<List<String>> lerArquivoCSV(String userPath) async {
  final arquivo = File("C:/clima/sensores/${userPath}_2024_1.csv");
  final linhas = await arquivo
      .openRead()
      .transform(latin1.decoder) // <- aqui o pulo do gato
      .transform(LineSplitter())
      .toList();
  return linhas;
  //Retorna uma lista de elementos "linha". Cada "linha" representa a linha de dados do Excel
}

//Pega elemento "linha" e split por (","). Retorna uma lista de Strings, cada String é um valor daquela uma linha
//Planejo usar esse méthod em um for
List<String> tratarDados(String linha ) {
  List<String> dadosDaLinha = linha.split(",");
  return dadosDaLinha;
}

//Method responsável por criar um objeto que representa a linha de dados do arquivo
Future<DataLine> gerarObj(String userPath, int index) async {
  final dados = await lerArquivoCSV(userPath);
  final linha = tratarDados(dados[index]);

  DataLine d = new DataLine();
  d.mes = int.parse(linha[0]);
  d.dia = int.parse(linha[1]);
  d.hora = int.parse(linha[2]);
  d.temperatura = double.parse(linha[3]);
  d.umidade = double.parse(linha[4]);
  d.densidadeAr = double.parse(linha[5]);
  d.velocidadeVento = double.parse(linha[6]);
  d.direcaoVento = double.parse(linha[7]);

  return d;
}

abstract class dadosOrganizados { //Classe que deixa os dados de forma mais acessível. Cada linha será um objeto
  late int mes;
  late int dia;
  late int hora;
  late double temperatura;
  late double umidade;
  late double densidadeAr;
  late double velocidadeVento;
  late double direcaoVento;
}
class DataLine extends dadosOrganizados {

}

