require "test_helper"

class DemultiplexFilterTest < MiniTest::Test
  def test_input
    filter = FilterChain::DemultiplexFilter.new
    def filter.pass(data)
      (@result ||= []) << data
    end

    filter << "\x00"
    filter << "\x00\x00"
    filter << "\x03fo"
    filter << "o"
    filter << "\x00\x00\x00\x03bar"

    assert_equal(["foo", "bar"], filter.instance_variable_get("@result"))
  end
end
