require 'yaml'
require 'pp'

data = YAML::load( File.open( ARGV[0] ) )

module_ = <<eos
##
# = Pegex Grammar module for pegex
#

class Grammar
    def initialize
        @tree = #{data}
    end
end
eos

puts module_
