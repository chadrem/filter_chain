module FilterChain  
  class Chain
    def initialize(opts = {})
      @opts = opts
      @filters = []
      @state = :initializing
      yield(self)
      @state = :initialized
    end

    def add(filter)
      raise InvalidStateError unless @state == :initializing
      @filters.last.next_filter = filter if @filters.last
      @filters << filter

      nil
    end

    def <<(data)
      @filters.first << data

      nil
    end

    def output
      raise MissingCollectorError if @filters.empty? || !@filters.last.is_a?(Collector)

      @filters.last.collection
    end

    def length
      @filters.length
    end
  end
end