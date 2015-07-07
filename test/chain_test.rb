require "test_helper"

class ChainTest < Minitest::Test
  def test_basic_usage

    chain = FilterChain::Chain.new(
      :filters => [
        {:class => FilterChain::Filter},
        {:class => FilterChain::Collector}
      ]
    )

    assert(2, chain.filters.length)
    assert_instance_of(FilterChain::Filter, chain.filters[0])
    assert_instance_of(FilterChain::Collector, chain.filters[1])
    assert_equal(0, chain.output.length)

    chain.input("foo")

    assert_equal(1, chain.output.length)
    assert_equal("foo", chain.output.first)
  end
end
