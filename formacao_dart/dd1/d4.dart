void main() {
  DateTime dataInicial = DateTime(2022, 9, 5); // Ano, mês, dia
  somarDias(dataInicial);
}

void somarDias(DateTime data){
  DateTime dataCalculada = data;
  int diasSomados = 0;

  while (diasSomados < 18){
    dataCalculada = dataCalculada.add(Duration(days: 1));

    if (dataCalculada.weekday >= 1 && dataCalculada.weekday <= 5) {
      diasSomados++;
    }
  }
  
  print("Data atual: ${data.day}/${data.month}/${data.year}");
  print("Data calculada: ${dataCalculada.day}/${dataCalculada.month}/${dataCalculada.year}");

}