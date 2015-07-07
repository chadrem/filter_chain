module FilterChain
  class InflateFilter < Filter
    private

    def on_initialize
    end

    def on_input(data)
      result = Zlib::Inflate.inflate(data)

      pass(result)
    end
  end
end