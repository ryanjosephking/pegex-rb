class Pegex
  class Parser
    attr_accessor :grammar, :receiver, :debug
    def initialize args
      @grammar = args[:grammar]
      @receiver = default_receiver args[:receiver]
      @debug = args[:debug]

      @input = nil
      @buffer = nil
      @indent = 0
      @position = nil # was: has 'position' => default => sub {0};

      @throw_on_error = true
      @wrap = true # Should come from receiver.wrap (pm)
      #py: terminator
    end

    def parse input, args = {}
      # XXX "input" is a simple string ATM.
      @input = input.clone
      find_grammar
    end

    def find_grammar
      raise 'No grammar specified' if @grammar.nil?
      if ::String == @grammar.class
        require @grammar
        @grammar = eval(camelize @grammar).new
      end
    end

    def default_receiver maybe_recvr
      maybe_recvr or begin
        require 'pegex/receiver'
        Receiver.new
      end
    end

    # (Mostly) lifted from ActiveSupport::Inflector#camelize -
    def camelize string
      string = string.to_s.capitalize
      string.gsub(/(?:_|(\/))([a-z\d]*)/i) {
        "#{$1}#{$2.capitalize}"
      }.gsub('/', '::')
    end
end
end
