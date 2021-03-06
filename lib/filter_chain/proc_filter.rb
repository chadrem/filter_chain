module FilterChain
  class ProcFilter < Filter
    private

    def on_initialize
      raise MissingBlockError unless block
    end

    def on_input(data)
      result = block.call(data)

      pass(result)
    end
  end
end