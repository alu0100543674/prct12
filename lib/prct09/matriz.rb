require './lib/prct09/fracciones.rb'

class Matriz
   include Enumerable
   include Comparable
        
   attr_reader :filas, :columnas, :Matriz
   
   # Constructor
   def initialize()
   end

   # Convertir el array a matriz Densa o Dispersa.
   # Contamos el numero de ceros que tiene cada array, en el caso
   # de que sea menor de 60% la matriz será Densa, en caso contrario será
   # Dispersa.
   def tipo(m)
     @filas = m.length
     @columnas = m[0].length

     matrizRe = nil
     tamanio = @filas * @columnas

     ceros = 0
   
     for i in 0...@filas
       for j in 0...@columnas
          if (m[i][j] == 0)
             ceros += 1
          end
       end
     end
     
     porcentaje = (ceros % tamanio)

     if (porcentaje < 0.6)
        matrizRe = MatrizDensa.new(@filas, @columnas)
        matrizRe.copia(m)
     else
        matrizRe = MatrizDispersa.new(@filas, @columnas)
        matrizRe.copia(m)
     end

     matrizRe

  end


end

class MatrizDensa < Matriz
  def initialize(filas, columnas)
    @filas, @columnas = filas, columnas
    @Matriz = Array.new{Array.new()}
    for i in 0...@filas
       @Matriz[i] = Array.new()
    end
  end

  # Si el array pasado a la clase Matriz tiene un numero de ceros menor que
  # el porcentaje 60% es Densa por lo que entra en la clase MatrizDensa y 
  # se crea una matriz con copia(other).
  def copia(other)
    @filas = other.length
    @columnas = other[0].length
  
    for i in 0...other.length
      for j in 0...other[i].length
         @Matriz[i][j] = other[i][j]
      end
    end
  end
  
end

class MatrizDispersa < Matriz
  def initialize(filas, columnas)
    @filas, @columnas = filas, columnas
    @Matriz = Hash.new()
  end

  # Si el array pasado a la clase Matriz tiene un numero de ceros mayor que
  # el porcentaje 60% es Dispersa por lo que entra en la clase 
  # MatrizDispersa y se crea un hash con copia(other), en el que solo se 
  # pondrán los valores distintos de cero.
  def copia(other)
    @filas = other.length
    @columnas = other[0].length
  
    for i in 0...other.length
      for j in 0...other[i].length
         if (other[i][j] != 0)
             @Matriz["#{i},#{j}"] = other[i][j].to_i
         end
      end
    end
  end
end
