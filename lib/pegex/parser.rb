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
      @position = nil

      @throw_on_error = true
      @wrap = true # Should come from receiver.wrap (.pm)
      #py: terminator
    end
    def parse input, args = {}
      # XXX "input" is a simple string ATM.
      @input = input.clone
      find_grammar
      find_receiver
      start_rule = find_start_rule args[:start_rule]
      # TODO?: give the receiver a reference to self ? (.pm)
    end
    def find_grammar
      raise 'No grammar specified' if @grammar.nil?
      if ::String == @grammar.class
        @grammar = string_new @grammar
      end
    end
    def find_receiver
      if ::String == @receiver.class
        @receiver = string_new @receiver
      end
    end
    def find_start_rule explicit = nil
      explicit or 
        @grammar.tree['+top'] or 
        @grammar.tree.has_key?('TOP') ? 'TOP' : nil
        # XXX Parser.pm has an (unreachable?) "die" here.
    end
    def default_receiver maybe_recvr
      maybe_recvr or begin
        require 'pegex/receiver'
        Receiver.new
      end
    end
    def string_new path
        require path
        eval(camelize path).new
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
