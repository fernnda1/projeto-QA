class Estoque
    attr_accessor :saldo, :nome 

    def mostrar_saldo 
        puts "Saldo: #{@saldo}"
        puts "Nome: #{@nome}"
        
    end

    def save(saldo, nome)
        @saldo = saldo
        @nome = nome
    end
end    
    estoque1= Estoque.new
    estoque1.save(1000, "Loja A")
    estoque1.mostrar_saldo
