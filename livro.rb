class Livro 
    attr_accessor :titulo, :autor
    def descricao
      puts "o livro #{titulo} foi escrito por #{autor}"
    end
 end

  livro01 = Livro.new
  livro01.titulo = "O Senhor dos Aneis"
  livro01.autor = "J.R.R. Tolkien"

  livro02 = Livro.new
  livro02.titulo = "1984"
  livro02.autor = "George Orwell"
  
  livro01.descricao
  livro02.descricao