module FilterChain  
  class Chain
    attr_reader :filters

    def initialize(opts = {})
      @opts = opts
      @filters = create_filters(opts[:filters] || [])
    end

    def input(data)
      @filters.first.input(data)
    end

    def output
      raise MissingCollector if @filters.empty? || !@filters.last.is_a?(Collector)

      @filters.last.collection
    end

    private

    def create_filters(filter_schema)
      results = []

      filter_schema.each do |elem|
        filter = elem[:class].new(elem[:opts])
        results.last.next_filter = filter unless results.empty?
        results << filter
      end

      results
    end
  end
end