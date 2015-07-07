require "test_helper"

class ProcFilterTest < MiniTest::Test
  def test_input
    filter = FilterChain::ProcFilter.new(:proc => Proc.new { |data|
      data * 2
    });

    def filter.pass(data)
      @result = data
    end

    filter.input("foo")

    assert_equal("foofoo", filter.instance_variable_get("@result"))
  end
end