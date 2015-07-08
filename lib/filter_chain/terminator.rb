module FilterChain
  class Terminator < Filter
    private

    def on_initialize
      raise MissingBlockError unless block
    end

    def on_input(data)
      result = block.call(data)
    end
  end
end