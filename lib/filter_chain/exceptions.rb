module FilterChain 
  class FilterChainError < RuntimeError; end

  class NextFilterMissing < FilterChainError; end
  class MissingCollector < FilterChainError; end
  class UnknownFormat < FilterChainError; end
end