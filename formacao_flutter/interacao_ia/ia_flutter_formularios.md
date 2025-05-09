## Como obter valor digitado pelo usuário em um ``TextField``?
* Em Flutter, para obter o valor digitado em um ``TextField``, você geralmente utiliza um ``TextEditingController``. Esse controlador é um objeto que você associa ao seu ``TextField`` e que te dá acesso ao texto atual do campo
  1. **Criar um ``TextEditingController``**: Declare uma variável do tpo ``TextEditingController`` em sua classe ``State``
  ~~~
  TextEditingController _controller = TextEditingController();
  ~~~
  2. **Associar o Controller ao ``TextField``**: No widget ``TextField``, utilize o parâmetro ``controller`` para associá-lo ao seu ``_controller``
  ~~~
  TextField(
  controller: _controller,
  decoration: InputDecoration(
    labelText: 'Digite algo',
    ),
  )
  ~~~
  3. **Acessar o valor**: Em qualquer lugar do seu código onde você tenha acesso ao ``_controller``, você pode obter o texto atual utilizando a propriedade ``text``
  ~~~
  String textoDigitado = _controller.text;
  print('O usuário digitou: $textoDigitado');
  ~~~
  ## Diferença entre um ``TextField`` e um ``TextFormField``
* Ambos são widgets para entrada de texto, mas o ``TextFormField`` é uma versão mais completa do ``TextField``, **integrada com o sistema de** ``Form`` **do Flutter**
  * ``TextField``: É um widget básico para exibir um campo de entrada de texto e obter o que o usuário digita. Ele oferece funcionalidades como controle de texto, estilos de decoração, teclado e callbacks para eventos de mudança.
  * ``TextFormField``: Entende as funcionalidades do ``TextField`` e adiciona a integração com o widget ``Form``. Isso significa que o ``TextFormField`` possui recursos para:
    * **Validação**: Permite definir regras de validação para o campo (por exemplo, campo obrigatório, formato do email correto)
    * **Gerenciamento de Estado dentro do Form**: Quando inserido dentro de um Form, o ``TextFormField`` contribui para o estado geral do formulário, permitindo verificar se todos os campos são válidos antes de prosseguir
    * **Salvar o valor**: Facilita a obtenção e o salvamento dos valores de múltiplos campos de uma vez através do ``Form``
  * Em resumi: use ``TextField`` quando você precisa apenas de um campo de entrada simpels e não precisa de uma validação integrada com um formulário. Use ``TextFormField`` quando o campo faz parte de um formulário e você precisa de funcionalidades de validação e gerenciamento de estado do formulário

## Quais parÂmetros são importantes do ``TextField``?
* O ``TextField`` possui diversos parâmetros para personalizar seu comportamento e aparência. Alguns dos mais importantes incuem:
  * ``controller``: Como vimos, associa um ``TextEditingController`` ao campo
  * ``decoration``: Um ``InputDecoration`` que permite personalizar a aparência do campo, como rótulo(``labelText``), texto de dica(``hintText``), ícones(``prefixIcon``, ``suffixIcon``), bordas(``border``), etc
  * ``keyboardType``: Define o tipo do teclado a ser exibido (por exemplo, ``TextInputType.text``, ``TextInputType.emailAddress``, ``TextInputType.number``)
  * ``obscureText``: Um booleano que, quando ``true``, oculta o texto digitado (útil para senhas)
  * ``onChanged``: Uma função que é chamada sempre que o valor do campo muda. Recebe o novo valor como argumento
  * ``onSubmitted``: Uma função que é chamada sempre que o usuário pressiona o botão "enviar" do teclado. Recebe o valor final do campo como argumento
  * ``maxLength``:`Define o número máximo de caracteres que o usuário pode digitar
  * ``style``: Permite definir o estilo do texto digitado (fonte, cor, tamanho, etc)
  * ``enabled``: Um booleano que controle se o campo poder ser interativo ou não
  * ``readOnly``: Um booleano que impede a edição do texto, mas ainda permite a seleção e cópia
  * ``inputFormatters``: Uma lista de formatadores que podem ser aplicados ao texto digitado, como restringir a entrada de apenas números

## O que significa validar uim campo de texto em Flutter?
* Verificar se o valor digitado pelo usuário atende a determinados critérios ou regras definidas pelo desenvolvedor. O objetivo da validação é garantir que os dados inseridos sejam válidos e estejam no formato esperado antes de serem processados ou enviados

### Exemplos de validação
* Verificar se um campo obrigatório não está vazio
* Verificar se o formato de um email é válido
* Verificar se uma senha tem um número mínimo de caracteres
* Verificar se um número está dentro de um determinado intervalo

A validação geralmente **retorna uma mensagem de erro** se a entrada for inválida ou ``null`` se for válida

## Diferença entre validação ``síncrona`` e ``assíncrona``
* Validação Síncrona: A validação síncrona ocorre imediatamento quando o valor do campo muda ou quando o formulário é submetido. A função de validação recebe o valor do campo e retorna o resultado da validação (``erro`` ou ``null``) de forma direta e imediata. Não há operações demoradas ou espera por resultados externos
  * Exemplo (síncrono): Verificar se um campo está vazio
  ~~~
  String? _validarCampoObrigatorio(String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo é obrigatório.';
  }
  return null;
  }
  ~~~
  * Validação Assíncrona:A validação assíncrona envolve operações que podem levar algum tempo para serem concluídas, como fazer uma chamada a um servidor para verificar se um nome de usuário já existe. A função de validação assíncrona retorna um ``Future`` que eventualmente produzirá o resultado da validação (``erro`` ou ``null``)
    * Exemplo (assíncrono): Verificar a disponibilidade de um nome de usuário em um servidor (simulado)
    ~~~
    Future<String?> _validarNomeUsuario(String? value) async {
    await Future.delayed(Duration(seconds: 2)); // Simula uma chamada de rede
    if (value == 'usuario_existente') {
    return 'Este nome de usuário já está em uso.';
    }
    return null;
    }
    ~~~
    No Flutter, a validação assíncrona é geralmente utilizada com um ``Form`` e o ``TextFormField``, onde o ``validator`` pode retornar um ``Future<String?>``. O ``Form`` gerencia a espera pela conclusão dessas validações
  
## Como personalizar um ``CheckBox``?
* Podemos personalizar a cor e a forma de um ``Checkbox`` utilizando o parA~metro ``checkColor`` para a cor da marca de seleção e o parâmetro ``shape`` para definir o formato da caixa
~~~
Checkbox(
  value: _estaSelecionado,
  onChanged: (bool? newValue) {
    setState(() {
      _estaSelecionado = newValue!;
    });
  },
  checkColor: Colors.yellow, // Cor da marca de seleção
  shape: RoundedRectangleBorder( // Define a forma como um retângulo com bordas arredondadas
    borderRadius: BorderRadius.circular(10.0), // Raio das bordas
  ),
  activeColor: Colors.blue, // Cor quando o CheckBox está selecionado
)
~~~

## Como personalizar a forma de um ``Radio``?
* Similar ao ``Checkbox``, o widget ``Radio`` também permite personalização através de parãmetros como ``fillColor`` para a cor de preenchimento quando selecionado e ``overlayColor`` para a cor do efeito de foco. Para a forma, você pode usar o ``materialTapTargetSize`` para controlar o tamanho da área sensível ao toque, o que indiretamente pode influenciar a aparência visual em alguns temas. No entanto, a forma básica do ``Radio`` (um círculo) é mais padronizada no Material Design
~~~
Radio<String>(
  value: 'opcao1',
  groupValue: _opcaoSelecionada,
  onChanged: (String? value) {
    setState(() {
      _opcaoSelecionada = value;
    });
  },
  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.green; // Cor quando selecionado
    }
    return Colors.grey; // Cor quando não selecionado
  }),
  overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return Colors.purple.withOpacity(0.2); // Cor do efeito de foco
    }
    return null;
  }),
)
~~~

## Como exibir mensagem de erro se a validação falhar?
* Ao utilizar ``TextFormField`` dentro de um ``Form``, a validação é feita através do parãmetro ``validator``. Se o ``validator`` retornar uma string derrro, essa mensagem será automaticamente exibida abaixo do campo se você utilizar um ``Form`` e chamar o método ``validate()`` do ``GlobalKey<FormState>`` associado ao seu formulário. O ``InputDecoration`` também possui o parâmetro ``errorText`` que pode ser usado para exibir uma mensagem de erro personalizada
~~~
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  validator: (value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Por favor, insira um email válido.';
    }
    return null;
  },
),
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      // Formulário válido, prosseguir
    }
  },
  child: Text('Enviar'),
)
~~~

## Verificação de email válido
* Você pode usar expressões regulares (RegEx) dentro do seu ``validator`` para verificar o formato do email
~~~
TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  validator: (value) {
    if (value == null || value.isEmpty || !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Por favor, insira um email válido.';
    }
    return null;
  },
)
~~~