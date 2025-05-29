# language: pt

Funcionalidade: Cadastro

  Esquema do Cenário: Criar cliente com dados variados
    Dado que eu visitei a página "/clientes/novo"
    Quando eu preencho o campo "nome" com "<nome>"
    E eu preencho o campo "email" com "<email>"
    E eu clico em "Salvar"
    Então eu vejo "<mensagem>" na página

    Quando eu preencho os seguintes campos:
      | nome     | email              | mensagem                    |
      | João     | joao@exemplo.com   | Cliente criado com sucesso |
      | Maria    | maria@exemplo.com  | Cliente criado com sucesso |
      | Invalido | invalido@.com      | Email inválido             |

  @cadastro @invalido
  Esquema do Cenário: Tentativa de cadastro com dados inválidos
    Dado que eu visitei a página "/customers/new"
    Quando eu preencho "<campo>" com "<valor>"
    E eu clico em "Salvar"
    Então eu vejo "<mensagem>" na página

    Quando eu preencho os seguintes campos:
      | campo  | valor          | mensagem           |
      | email  | cliente@.com   | Email inválido     |
      | nome   | null           | Nome inválido      |
      | cpf    | 000.000.000-00 | CPF inválido       |
      | celular| 123            | Celular inválido   |
