void main() {
  ehAnoBissexto(2016);
  ehAnoBissexto(1988);
  ehAnoBissexto(2000);
  ehAnoBissexto(2100);
  ehAnoBissexto(2300);
  ehAnoBissexto(1993);
}

void ehAnoBissexto(int ano) {
  String anoString = ano.toString();
  String dezenas = anoString.substring(2, 4);

  if (dezenas != "00" && ano % 4 == 0) {
    print("o ano $ano eh bissexto");
  } else if (dezenas == "00" && ano % 4 == 0 && ano % 100 == 0 && ano % 400 == 0) {
    print("O ano $ano eh bissexto");
  } else {
    print("O ano $ano nao eh bissexto");
  }
}
