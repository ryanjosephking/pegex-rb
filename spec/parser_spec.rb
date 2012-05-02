require 'helper'
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
    @prs = Pegex::Parser.new grammar: Pegex::Pegex::Grammar.new
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
  it "should pull in grammar by string" do
    prs = described_class.new grammar: 'testgrammar'
    prs.parse @input
    prs.grammar.class.should eq Testgrammar
    prs.camelize('hi_hi/bi').should eq 'HiHi::Bi'
  end
  it 'should not alter actual input' do
    before = @input.clone
    @prs.parse @input
    @input.should eq before
  end
end
