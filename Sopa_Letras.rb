

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
  end

  def to_s
   # "try to print a board, what does this method do?"
   puts "Sopa"
   puts
   p @tabla
   puts
   puts "Palabras a buscar"
   p @palabras
  ""
  end

  def busca
    for i in 0...@palabras[0].length
      puts "vamos a buscar: #{@palabras[0][i]}"
      horizontal(@palabras[0][i])
    end
    puts "cambio de busqueda"
    puts transpuesta = @tabla.transpose
    puts "Se encontraron"
    p @buenas
  end

  private
  def saca_palabras(n)
    tabla = []
    tabla << @@boards_templates[n]
    tablero = []
    tablero << tabla[0][0]
    tablero
  end

  def mix!(n)
    #This method should select an incomplete board and complete the board with random data.
    tabla = []
    tabla << @@boards_templates[n]
    tablero = []
    tablero << tabla[0][1]
    tablero_bueno = tablero.join(",")
    arreglo_aux = []
    #AQUI PERDIMOS EL STRING, LO HICIMOS PARA PODER ITERAR SOBRE LA PALABRA
    arreglo_aux << tablero_bueno.split("")
    abecedario = ("A".."Z").to_a
    arreglo_aux[0].each_with_index { |x, i|
    if x == "X"
      n = rand(26)
      arreglo_aux[0][i] = abecedario[n]
    end
    }
    palabra_join = arreglo_aux[0].join("")
    arreglo_final = []
    for i in 0...8
      palabra = palabra_join.slice(0,5)
      palabra_join = palabra_join.sub(palabra,"")
      arreglo_final << palabra.split
    end
    arreglo_final
  end

  def horizontal(palabra)
    if palabra.size > @tabla[0][0].length
      return
    else
      col, ren = 0, 0
      while ren < @tabla.length #8
        while col < @tabla[0][0].length #5
          puts "estamos en este dato: #{@tabla[ren][0][col]}"
          if (palabra[0] == @tabla[ren][0][col] || palabra[-1] == @tabla[ren][0][col])
            puts "algo coincidio"
            #ENCONTRE UNA PALABRA
            puts "este es el size de la palabra que busco: #{palabra.length}"
#CAMBIAMOS LOS INDICES, DECIA 0,COL
            a_probar = @tabla[ren][0].slice(col, palabra.length)
            p "esto es lo que probaremos: #{a_probar}"
            #SI SON DEL MISMO SIZE
            if a_probar.length == palabra.length
              puts "estamos probando"
              if a_probar == palabra
                puts "intentamos meter"
                @buenas << palabra
                return
              elsif a_probar.reverse == palabra
                puts "intentamos meter"
                @buenas << palabra
                return
              end
            end
          end
          col += 1
          if col == @tabla[0][0].length
            puts "hacemos cambio de renglon"
            ren += 1
          end
        end
        col = 0
      end
    end
  end

  def vertical(palabra)
    if palabra.size > @tabla[0][0].length
      return
    end
  end





end

board = Board.new
puts board
puts board.busca












