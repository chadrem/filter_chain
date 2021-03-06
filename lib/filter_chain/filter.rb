module FilterChain
  class Filter
    attr_reader :opts
    attr_reader :block
    
    attr_accessor :next_filter

    def initialize(opts = {}, &block)
      @opts = opts
      @block = block
      on_initialize
    end

    def <<(data)
      on_input(data)
    end

    def pass(data)
      next_filter ? next_filter << data : data
    end

    private

    #
    # Event handlers (override these).
    #

    def on_initialize
    end

    def on_input(data)
      pass(data)
    end
  end
end