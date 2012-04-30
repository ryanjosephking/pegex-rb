##
# = The Pegex Module for Ruby
#
#     require 'pegex'
#

class Pegex
  def initialize that_thing_there
    @thing = that_thing_there
  end
  def parse input
    input.reverse
  end
end
