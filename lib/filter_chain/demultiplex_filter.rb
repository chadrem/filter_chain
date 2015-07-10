module FilterChain
  class DemultiplexFilter < Filter
    private

    def on_initialize
      @buffer = ""
    end

    def on_input(data)
      @buffer << data
      payloads = []

      while @buffer.size >= 4
        if @buffer.size >= 4+(size=@buffer.unpack('N').first)
          @buffer.slice!(0,4)
          payload = @buffer.slice!(0,size)
          payloads << payload
          pass(payload)
        else
          break
        end
      end

      payloads
    end
  end
end
