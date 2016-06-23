require 'minitest/autorun'
require 'widen'

class TestWiden < Minitest::Test
  def test_no_mutation
    assert_equal 'ＡＢＣＤＥ', 'abcde'.upcase.widen
    assert_equal 'abcde', 'ＡＢＣＤＥ'.narrowen.downcase
  end

  def test_mutation
    x = 'abcde'.upcase
    x.widen!
    assert_equal 'ＡＢＣＤＥ', x

    x = 'ＡＢＣＤＥ'.downcase
    x.narrowen!
    assert_equal 'abcde', x
  end
end
