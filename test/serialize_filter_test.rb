require "test_helper"

class SerializeFilterTest < MiniTest::Test
  def test_json_input
    filter = FilterChain::SerializeFilter.new(:format => :json)
    def filter.pass(data)
      @result = data
    end

    filter.input({"foo" => "bar"})

    assert_equal("{\"foo\":\"bar\"}", filter.instance_variable_get("@result"))
  end

  def test_marshal_input
    filter = FilterChain::SerializeFilter.new(:format => :marshal)
    def filter.pass(data)
      @result = data
    end

    filter.input({"foo" => "bar"})

    assert_equal("\x04\b{\x06I\"\bfoo\x06:\x06ETI\"\bbar\x06;\x00T", filter.instance_variable_get("@result"))
  end

  def test_unknown_input
    assert_raises(FilterChain::FilterChainError) do
      filter = FilterChain::SerializeFilter.new(:format => nil)
    end

    assert_raises(FilterChain::FilterChainError) do
      filter = FilterChain::SerializeFilter.new
    end
  end
end