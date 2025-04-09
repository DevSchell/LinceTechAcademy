# Interação IA - Orientação a Objetos 1

## Principais conceitos de Orientação a Objetos
* POO é uma forma de organizar o código pensando em objetos do mundo real. E temos vários conceitos importantes como...
  
  | Conceito        | Explicação                                         | Exemplo em Dart                                             |
  |-----------------|----------------------------------------------------|-------------------------------------------------------------|
  | Classe          | Molde para criar objetos                           | ``class Pessoa {}``                                         |
  | Objeto          | Instância da classe                                | ``var p = Pessoa();``                                       |
  | Atributo        | Característica do objeto                           | ``String nome; int idade;``                                 |      
  | Método          |  Ação que o objeto pode fazer                      | ``void falar() { print("oi");}``                            |
  | Encapsulamento  | Esconder detalhes internos do objeto               | Usar ``private`` e getters/setters                          |
  | Herança         | Uma classe pode herdar de outra                    | ``class Aluno extends Pessoa {}``                           |
  | Polimorfismo    | Um mesmo método pode ter comportamentos diferentes | ``falar()`` pode ser diferente em ``Pessoa`` e ``Cachorro`` |

## Vantagens de usar Orientação a Objetos
| Vantagem     | Explicação                                                 |
 |--------------|------------------------------------------------------------|
| Organização  | O código fica **dividido em partes lógicas** (objetivos)   |
| Reutilização | Você reaproveita código com **herança** e **composição**   |
| Manutenção   | Fica mais **fácil consertar e atualizar** o código         |
| Modularidade | Dá pra dividir o projeto em **pequenos pedaços testáveis** |
| Leitura      | Fica mais **fácil de entender** o que cada parte faz       |

## O que são ``Factories`` em Dart?
* Uma ``factory`` em Dart é um **tipo especial de construtor**. Ela **não cria um novo objeto do zero toda** vez. Ela pode:
    * Retornar um **objeto já existente**
    * **Modificar** ou **preparar** dados antes de retornar o objeto
    * Escolher **qual classe retornar**

### Quando devo usar?
* Quando **não quiser** criar um novo objeto toda vez
* Quando precisar **esconder como o objeto é criado**
* Quando precisa **controlar melhor** o processo de construção