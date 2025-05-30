# Interação IA - Flutter: Internacionalização

## O que é internacionalização e qual a sua importância?

- **Internacionalização** (**i18n**) é o processo de preparar um aplicativo para que ele possa ser facilmente adaptado para diferentes idiomas e culturas, sem que seja necessário alterar o código-fonte para cada novo idioma
- Isso é importante pois permite que pessoas do mundo inteiro possam usar o seu aplicativo em seu próprio idioma, aumentando o alcance e a aceitação do produto em mercados globais

## Como funciona a internacionalização em Flutter?

- No Flutter, a internacionalização é feita através de pacotes como `flutter_localizations` e `intl`. O Flutter permite que você defina quais idiomas seu app suporta e, com base no idioma do dispositivo do usuário, exibe automaticamente os textos e formatos corretos. Isso é feito utilizando arquivos de recursos (normalmente arquivos .arb) que armazenam traduções das mensagens

## Quais dicas de uso dos arquivos ARB

- Os arquivos ARB (Application Resource Bundle) são arquivos no formato JSON onde cada chave representa uma mensagem/texto e o valor é a sua tradução
- O nome do arquivo segue o padrão app_<idioma>.arb
    - Ex: `app_en.arb` , para apps em inglês
- As chaves devem ser idênticas em todos os arquivos de idiomas para garantir que a tradução funcione corretamente
- Nunca altere os arquivos gerados automaticamente pelo Flutter, sempre edite apenas os arquivos `.arb`
- Sempre que modificar um arquivo `.arb`, rode o comando `flutter gen-l10n` para atulaizar as traduções geradas

## Quais cuidados devo ter ao usar o `INTL`?

- Certifique-se de instalar a versão coreta do pacote `intl`
- Sempre mantenha os arquivos `.arb` sincronizados e evite chaves duplicadas ou ausentes.
- para formatação de datas, números e moedas, utilize as funções do pacote `intl` para garantir que o formato seja adequado ao idioma/localidade do usuário
- Evite **hardcode** de textos, use sempre as chaves de tradução

## Como posso adicionar suporte para diferentes idiomas em meu apicativo Flutter?

- Instale os pacotes `flutter_localizations`
- Crie a pasta `lib/l10n` e adicione arquivos `.arb` para cada idioma desejado (ex: `app_en.arb`, `app_pt.arb`)
- Configure o arquivo `l10n.yaml` para indicar onde estão os arquivos de tradução
- No seu `MaterialApp`, adicione as configurações de `localizationsDelegates`
- e `supportedLocales`
- Utilize as chaves de tradução no seu código usando a classe gerada, por exemplo: `AppLocalizations.of(context)!.helloWorld`

## Tem um limite pra quantidade de idiomas que eu posso ter suporte no aplicativo?

- Não há um limite técnico imposto pelo Flutter para a quantidade.
- O limite prático é a manutenção e a organização dos seus arquivos de tradução, já que cada novo idioma exige a criação e atualização dos arquivos `.arb` correspondentes

## Como posso lidar com diferentes formatos de data, hora, moeda e medidas?

- Use funções do pacote `intl`, como `DateFormat`, `NumberFormat` e `CurrencyFormat`
- O Flutter, através dos delegates de localização, já adapta vários widgets automaticamente mas para textos personalizados, utilize as funções do `intl`

## Exemplo de formulário com internacionalização

```dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo I18n',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
      ],
      home: const MyFormPage(),
    );
  }
}

class MyFormPage extends StatelessWidget {
  const MyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.formTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: loc.nameLabel),
            ),
            TextField(
              decoration: InputDecoration(labelText: loc.emailLabel),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(loc.submitButton),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Exemplo de arquivos .arb:

`app_en.arb`:

```json
{
  "formTitle": "Registration Form",
  "nameLabel": "Name",
  "emailLabel": "Email",
  "submitButton": "Submit"
}
```

`app_pt.arb`:

```json
{
  "formTitle": "Formulário de Cadastro",
  "nameLabel": "Nome",
  "emailLabel": "E-mail",
  "submitButton": "Enviar"
}
```

- Sempre que alterar os arquivos `.arb`, lembre-se de rodar o comando `flutter gen-l10n` para atualizar as traduções