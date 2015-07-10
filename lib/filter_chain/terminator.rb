module FilterChain
  class Terminator < Filter
    private

    def on_initialize
      raise MissingBlockError unless block
    end

    def on_input(data)
      block.call(data)
      data
    end
  end
end