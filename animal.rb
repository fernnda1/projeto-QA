class Animal  
    attr_accessor :nome, :especie
    def falar
      puts "Eu sou um #{especie} chamado #{nome}"
    end 
 end

  gato = Animal.new
  gato.nome = "Mimi"
  gato.especie = "gato"

  cachorro = Animal.new
  cachorro.nome = "Rex"
  cachorro.especie = "cachorro"

  cachorro.falar
  gato.falar
  