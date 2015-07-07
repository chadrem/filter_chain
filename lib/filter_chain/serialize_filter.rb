module FilterChain
  class SerializeFilter < Filter
    private

    def on_initialize
      unless known_formats.include?(opts[:format]) 
        raise_unknown_format
      end
    end

    def on_input(data)
      result = case opts[:format]
      when :json
        JSON.dump(data)
      when :marshal
        Marshal.dump(data)
      else
        raise_unknown_format
      end

      pass(result)
    end

    def known_formats
      [:json, :marshal]
    end

    def raise_unknown_format
      raise FilterChainError, "Unknown format:#{opts[:format]}"
    end
  end
end