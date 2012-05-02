guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch('lib/pegex/pegex/grammar.rb') { 'spec/basic_spec.rb' }
  watch('lib/pegex/parser.rb') { 'spec/parser_spec.rb' }
  # watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

# vim:ft=ruby
