class Cidade
    attr_accessor :nome, :populacao
     def falar_nome
      puts "o nome da cidade é #{nome}"
    end
  end

  cidade1 = Cidade.new
  cidade1.nome = "Natal"
  cidade1.populacao = "100000" 

  cidade2 = Cidade.new
  cidade2.nome = "São Paulo"
  cidade2.populacao = "1000000"

  cidade3 = Cidade.new  
  cidade3.nome = "Rio de Janeiro"
  cidade3.populacao = "2000000"

  cidade1.falar_nome
  cidade2.falar_nome    
  cidade3.falar_nome
