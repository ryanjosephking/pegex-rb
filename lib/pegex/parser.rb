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
      raise 'No grammar specified' if @grammar.nil?
    end

    def default_receiver maybe_recvr
      maybe_recvr or begin
        require 'pegex/receiver'
        Receiver.new
      end
    end
  end
end
