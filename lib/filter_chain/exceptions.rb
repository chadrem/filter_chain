module FilterChain 
  class FilterChainError < RuntimeError; end
  class NextFilterMissingError < FilterChainError; end
  class MissingCollectorError < FilterChainError; end
  class UnknownFormatError < FilterChainError; end
  class MissingRequiredOptError < FilterChainError; end
  class InvalidStateError < FilterChainError; end
  class MissingBlockError < FilterChainError; end
end