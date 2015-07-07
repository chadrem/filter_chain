module FilterChain
  class Collector < Filter
    attr_reader :collection

    private

    def on_initialize
      @collection = []
    end

    def on_input(data)
      @collection << data
    end
  end
end