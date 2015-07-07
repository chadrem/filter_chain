module FilterChain
  class UnsplitHeaderFilter < Filter
    private

    def on_initialize
      @buffer = ""
    end

    def on_input(data)
      @buffer << data

      while @buffer.size >= 4
        if @buffer.size >= 4+(size=@buffer.unpack('N').first)
          @buffer.slice!(0,4)
          pass(@buffer.slice!(0,size))
        else
          break
        end
      end
    end
  end
end
