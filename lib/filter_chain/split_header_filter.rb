module FilterChain
  class SplitHeaderFilter < Filter
    private

    def on_initialize
    end

    def on_input(data)
      result = [data.respond_to?(:bytesize) ? data.bytesize : data.size, data].pack('Na*')

      pass(result)
    end
  end
end
