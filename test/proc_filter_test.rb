require "test_helper"

class ProcFilterTest < MiniTest::Test
  def test_input
    filter = FilterChain::ProcFilter.new do |data|
      data * 2
    end

    def filter.pass(data)
      @result = data
    end

    filter << "foo"

    assert_equal("foofoo", filter.instance_variable_get("@result"))
  end
end