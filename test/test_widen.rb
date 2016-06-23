require 'minitest/autorun'
require 'widen'

class TestWiden < Minitest::Test
  def test_sanity
    assert_equal 'ＡＢＣＤＥ', 'abcde'.upcase.widen
    assert_equal 'abcde', 'ＡＢＣＤＥ'.narrowen.downcase
  end
end
