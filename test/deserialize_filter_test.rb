require "test_helper"

class DeserializationFilterTest < MiniTest::Test
  def test_json_input
    filter = FilterChain::DeserializeFilter.new(:format => :json)
    def filter.pass(data)
      @result = data
    end

    filter << JSON.dump({"foo" => "bar"})

    assert_equal({"foo" => "bar"}, filter.instance_variable_get("@result"))
  end

  def test_marshal_input
    filter = FilterChain::DeserializeFilter.new(:format => :marshal)
    def filter.pass(data)
      @result = data
    end

    filter << Marshal.dump({"foo" => "bar"})

    assert_equal({"foo" => "bar"}, filter.instance_variable_get("@result"))
  end

  def test_unknown_input
    assert_raises(FilterChain::FilterChainError) do
      filter = FilterChain::DeserializeFilter.new(:format => nil)
    end

    assert_raises(FilterChain::FilterChainError) do
      filter = FilterChain::DeserializeFilter.new
    end
  end
end 