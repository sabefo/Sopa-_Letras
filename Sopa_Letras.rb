class Board
# You should put here the given boards templates
  @@boards_templates = [[["POEMA", "CANCION", "RONDAS", "RIMAS"],"POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"],
[["MANGO", "SANDIA", "MELON", "PLATANO"],"XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX"],
[["ROJO", "VERDE", "AZUL", "NEGRO"],"OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX"]]

  def initialize
    n = rand(3)
    @tabla = mix!(n)
    @palabras = saca_palabras(n)
    @buenas = []
    @transpuesta = []
  end

  def to_s
   # "try to print a board, what does this method do?"
   puts
   puts "Sopa"
   puts
   puts @tabla.map{|x| x.join("  ")}
   puts
   puts "Palabras a buscar"
   p @palabras
  end

  def busca
    puts
    puts "Busqueda horizontal"
    puts
    puts @tabla.map{|x| x.join("  ")}

    for i in 0...@palabras.length
      puts "Vamos a buscar: #{@palabras[i]}"
      horizontal(@palabras[i])
    end
    puts
    puts "Busqueda vertical"
    puts
    @transpuesta = @tabla.transpose
    puts @transpuesta.map{|x| x.join("  ")}
    
    @palabras.each{|x| vertical(x)}
    puts
    puts "Diagonal"
    @espacios = mete_espacios
    @palabras.each{|x| diagonal(x)}
    puts "Se encontraron"
    p @buenas
  end

  private
  def saca_palabras(n)
    tabla = []
    tabla = @@boards_templates[n]
    tablero = []
#    tablero << tabla[0][0]
    tablero = tabla[0]
    tablero
  end

  def mix!(n)
    #This method should select an incomplete board and complete the board with random data.
    tabla = []
    tabla = @@boards_templates[n]
    tablero = []
    tablero = tabla[1]
    arreglo_aux = []
    #AQUI PERDIMOS EL STRING, LO HICIMOS PARA PODER ITERAR SOBRE LA PALABRA
    arreglo_aux = tablero.split("")
    abecedario = ("A".."Z").to_a
    arreglo_aux.each_with_index { |x, i|
    if x == "X"
      n = rand(26)
      arreglo_aux[i] = abecedario[n]
    end
    }
    arreglo_final = []
    palabra = arreglo_aux.each_slice(5).to_a
#    p palabra[0]
  end

  def horizontal(palabra)
    if palabra.size > @tabla[0].length
      return
    else
      ren = 0
      while ren < @tabla.length #8
        if @tabla[ren].join.include?(palabra) || @tabla[ren].join.include?(palabra.reverse)
          @buenas << palabra
        end
        ren += 1
      end
    end
  end

  def vertical(palabra)
    if palabra.size > @transpuesta[0].length
      return
    else
      ren = 0
      while ren < @transpuesta.length #5
        if @transpuesta[ren].join.include?(palabra) || @transpuesta[ren].join.include?(palabra.reverse)
          @buenas << palabra
        end
        ren += 1
      end
    end  
  end

  def mete_espacios
    aux = @tabla.dup
    n = @tabla.length - 1
    for i in 0...@tabla.length
      i.times{aux[i].insert(0," ")}
      (n - i).times{aux[i].push(" ")}
    end
    aux = aux.transpose
  end

  def diagonal(palabra)
    if palabra.size > @espacios[0].length
      return
    else
      @espacios.each{  |renglon|
      if renglon.join.include?(palabra) || renglon.join.include?(palabra.reverse)
        @buenas << palabra
      end
      }
    end
  end
end

board = Board.new
#puts board
puts board.busca








