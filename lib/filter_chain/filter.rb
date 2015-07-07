module FilterChain
  class Filter
    attr_reader :opts
    
    attr_accessor :next_filter

    def initialize(opts = {})
      @opts = opts
      on_initialize
    end

    def input(data)
      on_input(data)
      
      nil
    end

    def pass(data)
      raise NextFilterMissing unless next_filter
      
      next_filter.input(data)
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