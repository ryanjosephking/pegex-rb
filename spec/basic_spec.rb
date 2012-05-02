require 'helper'
require 'pegex/pegex/grammar'

describe Pegex::Pegex::Grammar do
  it "should have a pegexish tree" do
    gr = described_class.new
    rules = gr.rules
    everything = rules.collect do |e| e.keys end.flatten
    ok_keys = %w(+min +max .sep .any .all .rgx .ref)
    filtered = everything.select do |e| ok_keys.include? e end
    everything.should eq filtered
  end
end
