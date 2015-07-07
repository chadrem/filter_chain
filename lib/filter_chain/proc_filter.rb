module FilterChain
  class ProcFilter < Filter
    private

    def on_initialize
      raise MissingRequiredOpt, ":proc is required" unless opts[:proc]
    end

    def on_input(data)
      result = opts[:proc].call(data)

      pass(result)
    end
  end
end