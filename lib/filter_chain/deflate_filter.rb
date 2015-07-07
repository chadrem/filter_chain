module FilterChain
  class DeflateFilter < Filter
    private

    def on_initialize
    end

    def on_input(data)
      result = Zlib::Deflate.deflate(data)

      pass(result)
    end
  end
end