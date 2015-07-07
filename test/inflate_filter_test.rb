require "test_helper"

class InflateFilterTest < MiniTest::Test
  def test_input
    filter = FilterChain::InflateFilter.new
    def filter.pass(data)
      @result = data
    end

    filter.input(Zlib::Deflate.deflate("foofoofoo"))

    assert_equal("foofoofoo", filter.instance_variable_get("@result"))
  end
end