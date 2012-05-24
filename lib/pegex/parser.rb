class Pegex
  NO_GRAMMAR_ERR = 'No grammar object specified'
  NO_START_RULE_ERR = <<-EOT
No start rule. Try one of these:
 - Pass Pegex::Parser#parse a :start_rule parameter
 - Add a '+top' key to your grammar tree whose value is the start rule
 - Add a 'TOP' key to your grammar that is the start rule itself.
  EOT
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
      raise NO_GRAMMAR_ERR if @grammar.nil?
      start_rule = find_start_rule args[:start_rule]
      # TODO?: give the receiver a reference to self ? (.pm)
      # TODO:
      # m = match start_rule
      # @receiver.data or m
    end
    def find_start_rule explicit = nil
      explicit or
        @grammar.tree['+top'] or
        @grammar.tree.has_key?('TOP') ? 'TOP' : fail(NO_START_RULE_ERR)
    end
    def default_receiver maybe_recvr
      maybe_recvr or begin
        require 'pegex/receiver'
        Receiver.new
      end
    end
    def get_min_max next_
        # There is a better way to say this.
        if next_.has_key? '+min' or next_.has_key? '+max'
            [ next_['+min'] || 0, next_['+max'] || 0 ]
        else
            [ 1, 1 ]
        end
    end

      class Buffer
        TOO_MANY_OVERREACHES =
          'Your grammar does not seem to terminate at end of stream'
        def initialize str
          @str = str
          @pos = 0
          @match_overreaches = 0
        end
        def match rxp
          flag_overreach if @pos >= @str.length
          m = @str.match(rxp, @pos) or return
          @pos = m.end 0
          m.captures.size > 1 ? [ m.captures ] : m.captures
        end
        def flag_overreach
            @match_overreaches += 1
            fail TOO_MANY_OVERREACHES if @match_overreaches > 1000
          end
      end
  end
end
