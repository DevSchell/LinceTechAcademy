import 'dart:math';

void main() {
  int numA = Random().nextInt(100);
  int numB = Random().nextInt(100);
  int mdc = 0;

  for (var i = 0; i < 100; i++) {
    if (numA % i == 0 && numB % i == 0) {
      mdc = i;
    }
  }

  print("MDC: $mdc");

  double mmc = (numA * numB) / mdc;
  print("MMC: $mmc");
}
