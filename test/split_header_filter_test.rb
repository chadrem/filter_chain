require "test_helper"

class SplitHeaderFilterTest < MiniTest::Test
  def test_input
    filter = FilterChain::SplitHeaderFilter.new
    def filter.pass(data)
      @result = data
    end

    filter.input("foo")

    assert_equal("\x00\x00\x00\x03foo", filter.instance_variable_get("@result"))
  end
end
