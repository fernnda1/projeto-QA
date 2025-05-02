class Pessoa
    attr_accessor :nome

    def soma(a, b)
        if a == 78
            puts "a é 78"
            a = 80
        else
            puts "a é diferente de 78"
            a = 60
        end
        return a + b
    end
end

p = Pessoa.new
p.nome = "Mar" 
puts p.nome

puts p.soma(55, 3)