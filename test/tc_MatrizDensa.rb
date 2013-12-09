require "./lib/prct09/matriz.rb"
require 'test/unit'

class Test_MatrizDensa < Test::Unit::TestCase
  
  def setup
    matrizSuper = Matriz.new()
    @matriz1 = matrizSuper.tipo([[1, 2], [3, 4]])
    @matriz2 = matrizSuper.tipo([[2, 3], [7, 1]])
  end

	def test_initialize
    assert_equal("1 2 \n3 4 \n", @matriz1.to_s)
    assert_equal("2 3 \n7 1 \n", @matriz2.to_s)
  end

	 def test_clase
    assert_equal("MatrizDensa", @matriz1.class.to_s)
    assert_equal("MatrizDensa", @matriz2.class.to_s)
  end
  
  def test_sum
    m_sum = @matriz1 + @matriz2
    assert_equal("3 5 \n10 5 \n", m_sum.to_s)
  end
  
  def test_mult
    m_mult = @matriz1 * @matriz2
    assert_equal("16 5 \n34 13 \n", m_mult.to_s)
  end
end

