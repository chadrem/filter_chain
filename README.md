# Filter Chain [![Build Status](https://travis-ci.org/chadrem/filter_chain.svg)](https://travis-ci.org/chadrem/filter_chain)

Filter Chain is a Ruby gem for processing data through a chain of filters in an object oriented style.

## Installation

Add this line to your application's Gemfile:

    gem "filter_chain"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filter_chain

## Chains

A ````Chain```` is a container for a set of filters. 

The below example serializes each input object to a JSON string, compresses the strings, prints the byte size of each string, and collects the results for future retrieval:

    chain = FilterChain::Chain.new { |c|
      c.add(FilterChain::SerializeFilter.new(:format => :json))

      c.add(FilterChain::DeflateFilter.new)

      c.add(FilterChain::ProcFilter.new { |data|
        puts "Byte size: #{data.bytesize}"
        data
      })

      c.add(FilterChain::Collector.new)
    }

    chain << "Hello world"
    chain << "How are you?"

    puts chain.output.inspect

## Filters

A ````Filter```` is an object that takes an input and passes it's output to the next link in a chain of filters.
A number of filters are pre-defined:

- ````DeflateFilter````
- ````InflateFilter````
- ````SerializeFilter````
- ````DeserializeFilter````
- ````MultiplexFilter````
- ````DemultiplexFilter````
- ````ProcFilter````
- ````Collector````
- ````Terminator````

You can easily create your own filters by inheriting from the ````Filter```` class and overriding the following handlers:

- ````on_initialize````
- ````on_input(data)````

You pass data to the next filter by calling the ````pass```` method in your ````on_input```` method.

## Collectors

A ````Collector```` is a specialized filter designed to be the last link in a chain.
All chains should end in a collector or terminator.
An array based collector is included, but you can easily define custom collectors using other data structures.

## Terminators

A ````Terminator```` takes the place of a collector when you want your chain to run a block of code at the end of the chain.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chadrem/filter_chain.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
