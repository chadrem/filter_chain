require "test_helper"

class UnsplitFilterTest < MiniTest::Test
  def test_input
    filter = FilterChain::UnsplitFilter.new
    def filter.pass(data)
      (@result ||= []) << data
    end

    filter.input("\x00")
    filter.input("\x00\x00")
    filter.input("\x03fo")
    filter.input("o")
    filter.input("\x00\x00\x00\x03bar")

    assert_equal(["foo", "bar"], filter.instance_variable_get("@result"))
  end
end