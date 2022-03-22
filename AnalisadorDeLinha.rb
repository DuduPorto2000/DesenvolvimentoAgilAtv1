class AnalisadorLinha
  
  def initialize (numero_linha, linha)
    @numero_linha = numero_linha
    @linha = linha
  end

  def frequency_analysis 
    contador = 0
    @palavras = []
    palavras_split = @linha.split
    palavras_hash= palavras_split.group_by(&:itself).transform_values(&:count)

    palavras_hash.each do |palavra, frequencia|
      if frequencia > contador
        contador = frequencia
        @frequencia = frequencia
      end
    end
    
    palavras_hash.each {|palavra, frequencia| @palavras << palavra if frequencia == contador}

  end

  def to_str
    return "Linha: #{@numero_linha} -> #{@linha}" + "\n" + "Palavra(s) com mais frequencia: '#{@palavras}'" + "\n" + "Frequencia da palavra: #{@frequencia}"
  end
end

analisador_linhas = []
File.open("teste").each { |linha| analisador_linhas << AnalisadorLinha.new($., linha.rstrip) }

analisador_linhas.each_with_index do |a, idx|
  a.frequency_analysis
  puts
  puts "Instancia 0#{idx+1}"
  puts a.to_str
end