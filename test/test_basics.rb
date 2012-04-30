require 'helper'

class PegexTest < Test::Unit::TestCase
  context Pegex do
    input_ = <<-EOT
  a: <b>
  b: /c/
  EOT
    should "run" do
      Pegex.new('some.thing.here').parse input_
    end
  end
end

__END__
Python:

  grammar = Pegex::Grammar.new
        parser = pegex.parser.Parser(
            grammar='pegex.grammar.pegex',
            receiver='pegex.ast',
            debug=False
        )
        input_ = """\
a: <b>
b: /c/
"""
        ast = parser.parse(input_)

Perl:

my $data = pegex($grammar)->parse($input);

use Pegex::Grammar;                                                         
use Pegex::Compiler;                                                        
my $pegex_grammar = Pegex::Grammar->new(                                    
    tree => Pegex::Compiler->compile($grammar)->tree,                       
);                                                                          
my $data = $pegex_grammar->parse($input); 
