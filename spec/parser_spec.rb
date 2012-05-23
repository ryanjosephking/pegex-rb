require 'helper'
require 'testgrammar'

require 'pegex/parser'

describe Pegex::Parser do
  it "new should handle explicit receiver" do
    prs = described_class.new grammar: {}, receiver: :yep
    prs.receiver.should eq :yep
  end
  it "new should default receiver" do
    expect { Pegex::Receiver }.to raise_error NameError
    prs = described_class.new grammar: {}
    prs.receiver.class.should eq Pegex::Receiver
  end
end


describe Pegex::Parser do
  before(:each) do
    require 'pegex/pegex/grammar'
    @grm = Pegex::Pegex::Grammar.new
    @prs = Pegex::Parser.new grammar: @grm
    @input = 'XXX' # XXX
  end
  # TODO:
  # it "should parse correct types of 'input'" do
  #  ...
  # end
  it 'should demand grammar' do
    @prs.grammar = nil
    expect { @prs.parse @input }.to raise_error RuntimeError
  end
  it 'should not alter actual input' do
    before = @input.clone
    @prs.parse @input
    @input.should eq before
  end

  def use_test_grammar tree
    tmp = Testgrammar.new
    tmp.stub(:tree) { tree }
    @prs.grammar = tmp
  end
  it 'should start_rule explicitly' do
    @prs.find_start_rule(:yeppo).should eq :yeppo
  end
  it 'should start_rule with "+top" key/val' do
    use_test_grammar '+top' => :in_tree_spec
    @prs.find_start_rule.should eq :in_tree_spec
  end
  it 'should start_rule with literal "TOP"' do
    use_test_grammar 'TOP' => true
    @prs.find_start_rule.should eq 'TOP'
  end
  it 'should require a start rule of some sort' do
    use_test_grammar 'monkeys' => true
    expect { @prs.find_start_rule }.to raise_error RuntimeError
  end

  it 'should get_min_max' do
      @prs.get_min_max({ '+min' => 3, '+max' => 10 }).should eq [ 3, 10 ]
      @prs.get_min_max({ '+min' => 3 }).should eq [ 3, 0 ]
      @prs.get_min_max({ '+max' => 10 }).should eq [ 0, 10 ]
      @prs.get_min_max({ }).should eq [ 1, 1 ]
  end

  # TODO?: it 'should @receiver.initialize' (Parser.pm line 91)
end
