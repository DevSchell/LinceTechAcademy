void main() {
 ContaBancaria conta = new ContaBancaria("", 100);

 conta.sacar(200);

}

class ContaBancaria {
  late final String _titular;
  late double _saldo;

  ContaBancaria(String titular, double saldo) { // Construtor da classe
    try {
      if( titular == ""){
        throw Exception("Os valores de titular e saldo inicial devem ser preenchidos");
      }
    this._titular = titular;
    this._saldo = saldo;
    print("Seja bem--vindo(a) $_titular"); //Só pra usar o _titular
    } catch (e){
      throw Exception("Os valores de titular e saldo inicial devem ser preenchidos");
    }
  }

  void sacar(double valor) { //Method "sacar"
    try {
      if( valor > _saldo){
        print("saldo insuficiente. Insira um valor que condiz com seu saldo atual");
        print("Saldo atual: $_saldo");
        return;
      }
      _saldo -= valor;
      print("Saque de $valor reais da sua conta");
      print("Saldo atual: $_saldo reais");
    } catch (e){
      print(e);
    }

  }

  void depositar(double valor){ // Method "depositar"
    _saldo += valor;
    print("Depósito de: $valor reais para a sua conta");
    print("Saldo atual: $_saldo");
  }
}