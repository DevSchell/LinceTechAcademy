import 'dart:io';

//TODO: Imprimir número de músicas
//TODO: Imprimir tempo total em horas da lista de músicas

void main() {
  List<Musica> listaMusicas = [];

  Musica m1 = Musica();
  m1.titulo = 'Ecos do Amanhã';
  m1.nomeArtista = 'Aurora Vell';
  m1.nomeAlbum = 'Horizonte Inverso';
  m1.duracaoSegundos = 243;
  listaMusicas.add(m1);

  Musica m2 = Musica();
  m2.titulo = 'Caminhos de Vidro';
  m2.nomeArtista = 'Noite Clara';
  m2.nomeAlbum = 'Fragmentos';
  m2.duracaoSegundos = 198;
  listaMusicas.add(m2);

  Musica m3 = Musica();
  m3.titulo = 'Entre Raios e Sombras';
  m3.nomeArtista = 'Lume Cinza';
  m3.nomeAlbum = 'Reflexo Tardio';
  m3.duracaoSegundos = 276;
  listaMusicas.add(m3);

  Musica m4 = Musica();
  m4.titulo = 'O Peso do Silêncio';
  m4.nomeArtista = 'Ícaro Mendes';
  m4.nomeAlbum = 'Versos Vazios';
  m4.duracaoSegundos = 221;
  listaMusicas.add(m4);

  Musica m5 = Musica();
  m5.titulo = 'Sol na Contramão';
  m5.nomeArtista = 'Verena Costa';
  m5.nomeAlbum = 'Dias de Tempestade';
  m5.duracaoSegundos = 207;
  listaMusicas.add(m5);

  bool isRunning = true;

  while (isRunning) {
    print("----Playlist----");
    print("1. Adicionar música");
    print("2. Pesquisar uma música...");
    print("3. Listar músicas");
    final resposta = stdin.readLineSync();

    switch (resposta) {
      case '1':
        try {
          Musica m = Musica();
          print("Insira o titulo da música: ");
          m.titulo = stdin.readLineSync() ?? 'Sem título';

          print("Insira o nome do artista/banda: ");
          m.nomeArtista = stdin.readLineSync() ?? 'Sem artista';

          print("Insira o nome do album: ");
          m.nomeAlbum = stdin.readLineSync() ?? 'Sem album';

          print("Insira a duração da música em segundos: ");
          try {
            m.duracaoSegundos = int.parse(stdin.readLineSync()!);
          } on Exception catch (e) {
            m.duracaoSegundos = 0;
            print("Valor inválido. Definido como 0 por padrão...");
          }

          listaMusicas.add(m);
          print("Música adicionada com sucesso!");
          stdin.readLineSync();
        } on Exception catch (e) {
          print(e);
        }
        break;

      case '2':
        print("Pesquisar uma música...");
        print("1. Pelo título");
        print("2. Pelo nome do artista");
        print("3. Pelo nome do album");
        final resposta = stdin.readLineSync();

        switch (resposta) {
          case '1':
            print("Insira o título");
            final palavraBuscada = stdin.readLineSync();

            for(var musica in listaMusicas){
              if(musica.titulo == palavraBuscada){
                print("Título: ${musica.titulo}");
                print("Artista: ${musica.nomeArtista}");
                print("Album: ${musica.nomeAlbum}");
                print("Duração: ${musica.duracaoSegundos} segundos");
              }
            }
            stdin.readLineSync();
            break;

          case '2':
            print("Insira o nome do artista: ");
            final palavraBuscada = stdin.readLineSync();

            for(var musica in listaMusicas){
              if(musica.nomeArtista == palavraBuscada){
                print("Título: ${musica.titulo}");
                print("Artista: ${musica.nomeArtista}");
                print("Album: ${musica.nomeAlbum}");
                print("Duração: ${musica.duracaoSegundos} segundos");
              }
            }
            stdin.readLineSync();
            break;

          case '3':
            print("Insira o nome do album: ");
            final palavraBuscada = stdin.readLineSync();

            for(var musica in listaMusicas){
              if(musica.nomeAlbum == palavraBuscada){
                print("Título: ${musica.titulo}");
                print("Artista: ${musica.nomeArtista}");
                print("Album: ${musica.nomeAlbum}");
                print("Duração: ${musica.duracaoSegundos} segundos");
              }
            }
            stdin.readLineSync();
            break;

          default:
            print("Opção inválida! Insira uma opção novamente");
            break;
        }

        break;

      case '3':
        for (var musica in listaMusicas) {
          print("---------------");
          print("Título: ${musica.titulo}");
          print("Artista: ${musica.nomeArtista}");
          print("Album: ${musica.nomeAlbum}");
          print("Duração: ${musica.duracaoSegundos} segundos");
        }
        stdin.readLineSync();
        break;

      default:
        print("Opção inválida! Digite opção novamente");
        break;
    }
  }
}

class Musica {
  late String titulo;
  late String nomeArtista;
  late String nomeAlbum;
  late int duracaoSegundos;
}
