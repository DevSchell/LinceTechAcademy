void main() {
  final String paragrafo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.";
  analisarParagrafo(paragrafo);
}

 void analisarParagrafo(String paragrafo) {
  //Requisito 1 -> Texto do parágrafo
   print(paragrafo);
   final String paragrafoLimpo = removerPontuacao(paragrafo).toLowerCase();

  //Requisito 2 -> Número de palavras
   final List<String> listaPalavras = paragrafo.split(' ');
   final int numPalavras = listaPalavras.length;
   print(numPalavras);

   //Requisito 3 -> Tamanho do texto
   final List<String> listaLetras = paragrafoLimpo.split('');
   final int numLetras = listaLetras.length;
   print(numLetras);

   //Requisito 4 -> Número de frases
   final List<String> listaFrases = paragrafo.split('.');
   final int numFrases = listaFrases.length;
   print(numFrases - 1); //Removendo 1, pois o ponto final atrapalha na separação de frases e acha que o ponto final da início à uma nova frase

   //Requisito 5 -> Número total de vogais
   int numVogais = 0;
   for(String letra in listaLetras){
     switch (letra){
       case 'a':
       case 'e':
       case 'i':
       case 'o':
       case 'u':
         numVogais++;
         break;
       default:
         break;
     }
   }
   print(numVogais);

   //Requisito 6 -> Consoantes presentes no texto
   Set<String> listaConsoantes = {};
   for(String letra in listaLetras){
     if (letra != "a" && letra != 'e' && letra != 'i' && letra != 'o' && letra != 'u'){
       listaConsoantes.add(letra);
     }
   }
   print(listaConsoantes);
 }

 String removerPontuacao(String texto){
   String textoSemPontuacao = texto.replaceAll(RegExp(r'[.,;]'), '');
   return textoSemPontuacao;
 }
