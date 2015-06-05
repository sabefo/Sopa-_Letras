

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
   puts @tabla.map{|x| x.join}
   puts
   puts "Palabras a buscar"
   p @palabras
  ""
  end

  def busca
    for i in 0...@palabras.length
      puts "vamos a buscar: #{@palabras[i]}"
      horizontal(@palabras[i])
    end
    puts
    puts "cambio de busqueda"
    @transpuesta = @tabla.transpose
    puts @transpuesta.map{|x| x.join}
    
    @palabras.each{|x| vertical(x)}

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
#    tabla << @@boards_templates[n]
    tabla = @@boards_templates[n]
    tablero = []
#    tablero << tabla[0][1]
    tablero = tabla[1]
#    tablero_bueno = tablero.join(",")
    arreglo_aux = []
    #AQUI PERDIMOS EL STRING, LO HICIMOS PARA PODER ITERAR SOBRE LA PALABRA
#    arreglo_aux << tablero.split("")
    arreglo_aux = tablero.split("")
    abecedario = ("A".."Z").to_a
    arreglo_aux.each_with_index { |x, i|
    if x == "X"
      n = rand(26)
      arreglo_aux[i] = abecedario[n]
    end
    }
#    palabra_join = arreglo_aux.join("")
    arreglo_final = []
#    for i in 0...8
      palabra = arreglo_aux.each_slice(5).to_a
#      arreglo_aux = arreglo_aux.sub(palabra,"")
#      arreglo_final << palabra.split
#    end
    palabra
  end

  def horizontal(palabra)
    if palabra.size > @tabla[0].length
      return
    else
      col, ren = 0, 0
      while ren < @tabla.length #8
        while col < @tabla[0].length #5
          puts "estamos en este dato: #{@tabla[ren][col]}"
          if (palabra[0] == @tabla[ren][col] || palabra[-1] == @tabla[ren][col])
            puts "algo coincidio"
            #ENCONTRE UNA PALABRA
            puts "este es el size de la palabra que busco: #{palabra.length}"
#CAMBIAMOS LOS INDICES, DECIA 0,COL
            a_probar = @tabla[ren].slice(col, palabra.length).join("")
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
          if col == @tabla[0].length
            puts "hacemos cambio de renglon"
            ren += 1
          end
        end
        col = 0
      end
    end
  end

  def vertical(palabra)
    if palabra.size > @transpuesta[0].length
      return
    else
      col, ren = 0, 0
      while ren < @transpuesta.length #8
        while col < @transpuesta[0].length #5
          puts "estamos en este dato: #{@transpuesta[ren][col]}"
          if (palabra[0] == @transpuesta[ren][col] || palabra[-1] == @transpuesta[ren][col])
            puts "algo coincidio"
            #ENCONTRE UNA PALABRA
            puts "este es el size de la palabra que busco: #{palabra.length}"
#CAMBIAMOS LOS INDICES, DECIA 0,COL
            a_probar = @transpuesta[ren].slice(col, palabra.length).join("")
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
          if col == @transpuesta[0].length
            puts "hacemos cambio de renglon"
            ren += 1
          end
        end
        col = 0
      end
    end  end





end

board = Board.new
puts board
puts board.busca












