import 'dart:convert';
import 'dart:io';

void main() async {
  bool isRunning = true;
  while (isRunning) {
    print("Olá, Leandro. Que relatório você precisa?");
    print("1 - Temperatura");
    print("2 - Umidade");
    print("3 - Direção do vento");
    print("4 - Sair do programa");
    print("Digite o número da opção desejada: ");
    String? opt = stdin.readLineSync();

    switch (opt) {
      case "1":
        //Trabalhando com mês
        final listaDeObj = gerarListaObj("SC", "1");
        var tempMaxima = await getTempMaxEstadoMes(await listaDeObj);
        print("Temperatura máxima: $tempMaximaº celsius");

        var tempMinima = await getTempMinEstadoMes(await listaDeObj);
        print("Temperatura mínima: $tempMinimaº celsius");

        var tempMediaHora = await getTempMedEstadoHora(await listaDeObj);
        print(
          "Temperatura média por hora do estado: ${tempMediaHora.toStringAsFixed(2)}º celsius",
        );

        //Trabalhando com ano
        List<List<DataLine>> listaDeMeses = await getMeses("SC");
        double mediaAno = await getTempMedEstadoAno(await listaDeMeses);
        print("Temperatura média do ano: ${mediaAno.toStringAsFixed(2)}");

        double maxAno = await getTempMaxEstadoAno(await listaDeMeses);
        print("Temperatura máxima do ano: $maxAno");

        double minAno = await getTempMinEstadoAno(await listaDeMeses);
        print("Temperatura mínima do ano: $minAno");
        break;

      case "2":
        //Trabalhando com mês
        final listaDeObj = gerarListaObj(
          "SC",
          "1",
        ); //Objeto teste com funções referentes à "mês"

        double umidadeMediaMes = await getUmidadeMedEstadoMes(await listaDeObj);
        print("Umidade média: ${umidadeMediaMes.toStringAsFixed(2)}");

        double umidadeMaxMes = await getUmidadeMaxEstadoMes(await listaDeObj);
        print("Umidade máxima do mês: ${umidadeMaxMes.toStringAsFixed(2)}");

        double umidadeMin = await getUmidadeMinEstadoMes(await listaDeObj);
        print("Umidade mínima do mês: ${umidadeMin.toStringAsFixed(2)}");

        //Trabalhando com ano
        List<List<DataLine>> listaDeMeses = await getMeses("SC");

        double umidadeMediaAno = await getUmidadeMedEstadoAno(
          await listaDeMeses,
        );
        print("umidade média do ano: ${umidadeMediaAno.toStringAsFixed(2)}");

        double umidadeMaxAno = await getUmidadeMaxEstadoAno(await listaDeMeses);
        print("Umidade máxima do ano: ${umidadeMaxAno.toStringAsFixed(2)}");

        double umidadeMinAno = await getUmidadeMinEstadoAno(await listaDeMeses);
        print("Umidade mínima do ano: ${umidadeMinAno.toStringAsFixed(2)}");
        break;

      case "3":
        //Trabalhando com mês
        final listaDeObj = gerarListaObj("SC", "1");
        final direcaoFrequente = await getDirecaoDoVentoMes(await listaDeObj);
        print("Direção mais frequente: $direcaoFrequente");
        break;

      case "4":
        print("... FIM ...");
        isRunning = false;
        break;

      default:
        print(
          "Opção inválida. Por favor insira apenas um dos numerias referentes às escolhas do menu.",
        );
        stdin.readLineSync();
        break;
    }
  }
}

//TODO: Refazer função
Future<double> getDirecaoDoVentoMes(List<DataLine> listaDeObjetos) async {
  Map<double, int> contagemDirecoes = {};

  //Conta quantas vezes cada direção de vento aparece
  for (var dado in listaDeObjetos) {
    double direcao = dado.direcaoVento;

    if (contagemDirecoes.containsKey(direcao)) {
      contagemDirecoes[direcao] = contagemDirecoes[direcao]! + 1;
    } else {
      contagemDirecoes[direcao] = 1;
    }
  }

  //Encontra a direção com maior frequência
  double direcaoMaisFrequente = contagemDirecoes.keys.first;
  int maiorContagem = contagemDirecoes[direcaoMaisFrequente]!;

  for (var entrada in contagemDirecoes.entries) {
    if (entrada.value > maiorContagem) {
      direcaoMaisFrequente = entrada.key;
      maiorContagem = entrada.value;
    }
  }

  return direcaoMaisFrequente;
}

Future<double> getUmidadeMinEstadoAno(List<List<DataLine>> listaMeses) async {
  double min = await getUmidadeMaxEstadoAno(await listaMeses);

  for (int i = 0; i < listaMeses.length; i++) {
    for (int j = 0; j < listaMeses[i].length; j++) {
      if (min > listaMeses[i][j].umidade) {
        min = listaMeses[i][j].umidade;
      }
    }
  }
  return min;
}

//Função pra conseguir umidade máxima do ano
Future<double> getUmidadeMaxEstadoAno(List<List<DataLine>> listaMeses) async {
  double max = 0;

  for (int i = 0; i < listaMeses.length; i++) {
    for (int j = 0; j < listaMeses[i].length; j++) {
      if (max < listaMeses[i][j].umidade) {
        max = listaMeses[i][j].umidade;
      }
    }
  }
  return max;
}

//Função pra conseguir média de umidade do ano
Future<double> getUmidadeMedEstadoAno(List<List<DataLine>> listaMeses) async {
  double media = 0;
  int totalAdicoes = 0;
  for (int i = 0; i < listaMeses.length; i++) {
    for (int j = 0; j < listaMeses[i].length; j++) {
      media += listaMeses[i][j].umidade;
      totalAdicoes++;
    }
  }
  media = media / totalAdicoes;
  return media;
}

//Função pra conseguir umidade mínima do mês
Future<double> getUmidadeMinEstadoMes(List<DataLine> listaDeObj) async {
  double min = await getTempMaxEstadoMes(listaDeObj);
  for (DataLine objeto in listaDeObj) {
    if (min > objeto.umidade) {
      min = objeto.umidade;
    }
  }
  return min;
}

//Função pra conseguir umidade máxima do mês em questão
double getUmidadeMaxEstadoMes(List<DataLine> listaDeObj) {
  double max = 0;
  for (DataLine obj in listaDeObj) {
    if (max < obj.umidade) {
      max = obj.umidade;
    }
  }
  return max;
}

//Função pra conseguir a umidade média do mês
Future<double> getUmidadeMedEstadoMes(List<DataLine> listaDeObj) async {
  double media = 0;
  for (DataLine obj in listaDeObj) {
    media += obj.umidade;
  }
  media = media / listaDeObj.length;
  return media;
}

//Função pra conseguir temperatura mínima do ano do estado
Future<double> getTempMinEstadoAno(List<List<DataLine>> listaMeses) async {
  double min = await getTempMaxEstadoAno(await listaMeses);

  for (int i = 0; i < listaMeses.length; i++) {
    for (int j = 0; j < listaMeses[i].length; j++) {
      if (min > listaMeses[i][j].temperatura) {
        min = listaMeses[i][j].temperatura;
      }
    }
  }
  return min;
}

//Função pra conseguir temperatura máxima do ano do estado
Future<double> getTempMaxEstadoAno(List<List<DataLine>> listaMeses) async {
  double max = 0;
  for (int i = 0; i < listaMeses.length; i++) {
    for (int j = 0; j < listaMeses[i].length; j++) {
      if (max < listaMeses[i][j].temperatura) {
        max = listaMeses[i][j].temperatura;
      }
    }
  }
  return max;
}

//Função pra conseguir a média de temperatura do ano um estado
Future<double> getTempMedEstadoAno(List<List<DataLine>> listaMeses) async {
  double mediaAno = 0;
  int totalAdicoes = 0;
  for (int i = 0; i < listaMeses.length; i++) {
    for (int j = 0; j < listaMeses[i].length; j++) {
      mediaAno += listaMeses[i][j].temperatura;
      totalAdicoes++;
    }
  }
  mediaAno = mediaAno / totalAdicoes;
  return mediaAno;
}

//Função pra conseguir todos os meses de um estado
Future<List<List<DataLine>>> getMeses(String userPath) async {
  List<List<DataLine>> listaMeses = []; //Acho que esse é o caminho...
  for (int i = 1; i < 12; i++) {
    final listaDeObj = gerarListaObj(userPath, "${i}");
    listaMeses.add(await listaDeObj);
  }
  return listaMeses;
}

//Função pra conseguir a temperatura média de cada estado por hora
Future<double> getTempMedEstadoHora(List<DataLine> listaDeObj) async {
  List<double> valores = [];
  double media = 0;
  for (int i = 0; i < 25; i++) {
    valores.add(listaDeObj[i].temperatura);
  }

  for (int i = 0; i < valores.length; i++) {
    media += valores[i];
  }
  media = media / valores.length;
  return media;
}

//Função pra conseguir temperatura mínima de cada estado por mês
Future<double> getTempMinEstadoMes(List<DataLine> listaDeObj) async {
  double min = await getTempMaxEstadoMes(listaDeObj);
  for (DataLine objeto in listaDeObj) {
    if (min > objeto.temperatura) {
      min = objeto.temperatura;
    }
  }
  return min;
}

//Função pra conseguir temperatura máxima de cada estado por mês
double getTempMaxEstadoMes(List<DataLine> listaDeObj) {
  double max = 0;
  for (DataLine obj in listaDeObj) {
    if (max < obj.temperatura) {
      max = obj.temperatura;
    }
  }
  return max;
}

//Função pra conseguir temperatura média de cada estado por mês
Future<double> getTempMedEstadoMes(List<DataLine> listaDeObj) async {
  double media = 0;
  for (DataLine obj in listaDeObj) {
    media += obj.temperatura;
  }
  media = media / listaDeObj.length;
  return media;
}

Future<List<DataLine>> gerarListaObj(String userPath, String mes) async {
  List<String> lista = await lerArquivoCSV(
    userPath,
    mes,
  ); //TODO: Atualizar parâmetro
  List<DataLine> listaObjetos = [];
  for (int i = 1; i < lista.length; i++) {
    //Index começa em 1, pra pular o header da tabela de dados
    var obj = gerarObj(userPath, i);
    listaObjetos.add(await obj);
  }
  return listaObjetos;
}

//Retorna cada linha como uma string dentro de uma lista
Future<List<String>> lerArquivoCSV(String userPath, String mes) async {
  final arquivo = File("C:/clima/sensores/${userPath}_2024_$mes.csv");
  final linhas =
      await arquivo
          .openRead()
          .transform(latin1.decoder) // <- aqui o pulo do gato
          .transform(LineSplitter())
          .toList();
  return linhas;
  //Retorna uma lista de elementos "linha". Cada "linha" representa a linha de dados do Excel
}

//Pega elemento "linha" e split por (","). Retorna uma lista de Strings, cada String é um valor daquela uma linha
//Planejo usar esse méthod em um for
List<String> tratarDados(String linha) {
  List<String> dadosDaLinha = linha.split(",");
  return dadosDaLinha;
}

//Method responsável por criar um objeto que representa a linha de dados do arquivo
Future<DataLine> gerarObj(String userPath, int index) async {
  final dados = await lerArquivoCSV(userPath, "1"); //TODO: atualizar parâmetro
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

abstract class dadosOrganizados {
  //Classe que deixa os dados de forma mais acessível. Cada linha será um objeto
  late int mes;
  late int dia;
  late int hora;
  late double temperatura;
  late double umidade;
  late double densidadeAr;
  late double velocidadeVento;
  late double direcaoVento;
}

class DataLine extends dadosOrganizados {}

//TAVA NO CASE 2
// late String userPath;
// print("De qual estado você quer tirar o relatório?");
// print("1 - São Paulo");
// print("2 - Santa Catarina");
// dynamic option = stdin.readLineSync();
// if (option == "1") {
// userPath = "SP";
// } else if (option == "2") {
// userPath = "SC";
// } else {
// print("Por favor insira uma opção válida. 1 ou 2");
// return;
// }
// List<DataLine> lista = await gerarListaObj(userPath);
// print(await getTempMedEstadoMes(lista));
