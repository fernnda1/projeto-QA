class Maioridade
	def digitar
		puts "Digite a sua idade"
		idade = gets.chomp.to_i
		if idade < 18
			puts "menor de idade"
		else 
			puts "maior de idade"	
		end	
	end	

end
