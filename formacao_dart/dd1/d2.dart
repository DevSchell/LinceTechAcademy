void main() {
  List<double> temperaturas = [0.0, 4.2, 15.0, 18.1, 21.7, 40.0, 41.0];
  converterTemperaturas(temperaturas);
}

void converterTemperaturas(List<double> temperaturas) {
  print("Iniciando conversão");

  for (int i = 0; i < temperaturas.length; i++) {
    double fahrenheit = (temperaturas[i] * (9/5)) + 32;
    double kelvin = temperaturas[i] + 273.15;
    print("Celsius:${temperaturas[i]} Fahrenheit: ${fahrenheit.toStringAsFixed(2)} Kelvin: ${kelvin.toStringAsFixed(2)}");
  }

}