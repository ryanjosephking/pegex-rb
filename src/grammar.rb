require 'yaml'

data = YAML::load(File.open ARGV[0])

puts <<eos
##
# = Pegex Grammar module for pegex
#

# Note: This is a generated file. However, I won't tell you not to edit,
# because... who am I to say?

class Pegex
  module Pegex
  class Grammar
    attr_accessor :tree
    def initialize
      @tree = #{data}
    end
    def rules
      @tree.values.select do |e| Hash == e.class end
    end
    end
  end
end
eos
