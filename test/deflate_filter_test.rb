require "test_helper"

class DeflateFilterTest < MiniTest::Test
  def test_input
    filter = FilterChain::DeflateFilter.new
    def filter.pass(data)
      @result = data
    end

    filter << "foofoofoo"

    assert_equal(Zlib::Deflate.deflate("foofoofoo"), filter.instance_variable_get("@result"))
  end
end