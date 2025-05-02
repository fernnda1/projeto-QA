class Pessoa
    attr_accessor :nome
  end
  
  p = Pessoa.new
  p.nome = "Maria"    # usa o "set"
  puts p.nome         # usa o "get"
  

  class animal  
    attr_accessor :nome, :especie
    def falar
      puts "Eu sou um #{especie} chamado #{nome}"
  end

  gato = animal.new
  gato.nome = "Mimi"
  gato.especie = "gato"

  cachorro = animal.new
  cachorro.nome = "Rex"
  cachorro.especie = "cachorro"

  cachorro.falar
  gato.falar
  end
  
 1) class Gato
    def  miar
      puts "Miau!"
    end
  end
  

  2)class Carro
    attr_accessor :nome
  end
  
  carro = Carro.new
  carro.nome = "Fusca"
  puts carro.nome 

  3)filme={"titulo", "ano"}

  puts filme[:titulo]

  4) letra c

  
5. Crie um hash chamado livro com chaves :titulo e :autor.
livro { titulo: "as crônicas de narnia", autor: "esqueci"}
    puts livro[:titulo]         


    1. Crie um Hash chamado animal com as chaves :especie e :nome.
    Depois mostre o nome do animal.

animal = { especie: "gato", nome: "Mimi" }
puts animal[:nome]


2. Corrija o erro neste Hash:

produto = { "nome" => "Camiseta", "preco" => 50 }

3. Complete o código para criar um Hash de um livro com as chaves :titulo, :autor e :ano, e imprima todas as informações.
livro = { titulo: "lerolero". autor: "fulanodetal", ano: "2012"}
puts livro[:titulo]
puts livro[:autor]
puts livro[:ano]

4. Crie um hash vazio chamado conta_bancaria e adicione:

saldo: 1000

tipo: "corrente"

Depois imprima o saldo.

conta_bancaria = {}
conta_bancaria[:saldo]= 1000
conta_bancaria[:tipo]=corrente
puts conta_bancaria[:saldo]

2) class Livro 
    attr_accessor :titulo, :autor
    def descricao
      puts "o livro #{titulo}" fis escrito por #{autor}"
    end
  end

  livro01 = Livro.new
  livro01.titulo = "O Senhor dos Anéis"
  livro01.autor = "J.R.R. Tolkien"

  livro02 = Livro.new
  livro02.titulo = "1984"
  livro02.autor = "George Orwell"
  
  livro01.descricao
  livro02.descricao

  1) A classe "Pessoa" deve estar com o "P" maiusculo 

  3) F
     V
     V

  4)class Cidade
    attr_accessor :nome, :população
     def falar_nome
      puts "o nome da cidade é #{nome}"
    end
  end

  cidade1 = Cidade.new
  cidade1.nome = "Natal"
  cidade1.populaçao = "100000" 

  cidade2 = Cidade.new
  cidade2.nome = "São Paulo"
  cidade2.populaçao = "1000000"

  cidade3 = Cidade.new  
  cidade3.nome = "Rio de Janeiro"
  cidade3.populaçao = "2000000"

  cidade1.falar_nome
  cidade2.falar_nome
  cidade3.falar_nome
  end