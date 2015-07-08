require "test_helper"

class FilterTest < MiniTest::Test
  def test_input
    filter = FilterChain::Filter.new
    def filter.pass(data)
      @result = data
    end

    filter << "foo"

    assert_equal("foo", filter.instance_variable_get("@result"))
  end
end