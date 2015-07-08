require "test_helper"

class TerminatorTest < MiniTest::Test
  def test_input
    result = nil

    filter = FilterChain::Terminator.new do |data|
      result = data
    end

    filter << "foo"

    assert_equal("foo", result)
  end
end