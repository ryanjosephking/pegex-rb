require 'yaml'

data = YAML::load(File.open ARGV[0])

puts <<eos
##
# = Pegex Grammar module for pegex
#

# Note: This is a generated file. However, I won't tell you not to edit,
# because... who am I to say?

class Grammar
    def initialize
        @tree = #{data}
    end
end
eos
