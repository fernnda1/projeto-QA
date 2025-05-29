# language: pt

@cadastro @valido
Funcionalidade: Cadastro de clientes

  Scenario Outline: Criar um novo cliente com dados válidos
    Dado que eu visitei a página "/customers/new"
    Quando eu preencho "<campo>" com "<valor>"
    E eu clico em "Salvar"
    Então eu vejo "<mensagem>" na página

    Exemplos:
      | campo  | valor                | mensagem                      |
      | email  | cliente@exemplo.com | Cliente criado com sucesso    |
      | nome   | João da Silva       | Cliente criado com sucesso    |
      | cpf    | 123.456.789-09      | Cliente criado com sucesso    |
      | celular| (11) 91234-5678     | Cliente criado com sucesso    |

  @cadastro @invalido
  Scenario Outline: Tentativa de cadastro com dados inválidos
    Dado que eu visitei a página "/customers/new"
    Quando eu preencho "<campo>" com "<valor>"
    E eu clico em "Salvar"
    Então eu vejo "<mensagem>" na página

    Exemplos:
      | campo  | valor          | mensagem           |
      | email  | cliente@.com   | Email inválido     |
      | nome   | null           | Nome inválido      |
      | cpf    | 000.000.000-00 | CPF inválido       |
      | celular| 123            | Celular inválido   |
