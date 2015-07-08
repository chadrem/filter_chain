require "test_helper"

class ChainTest < Minitest::Test
  def test_input

    chain = FilterChain::Chain.new do |c|
      c.add(FilterChain::Filter.new)
      c.add(FilterChain::Collector.new)
    end

    assert(2, chain.length)
    assert_equal(0, chain.output.length)

    chain << "foo"

    assert_equal(1, chain.output.length)
    assert_equal("foo", chain.output.first)
  end
end
