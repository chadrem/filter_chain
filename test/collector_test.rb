require "test_helper"

class CollectorTest < MiniTest::Test
  def test_input
    collector = FilterChain::Collector.new

    assert_equal(0, collector.collection.length)

    collector << "foo"

    assert_equal(1, collector.collection.length)
  end
end