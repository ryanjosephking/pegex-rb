# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "pegex-rb"
  gem.homepage = "http://github.com/ryanjosephking/pegex-rb"
  gem.license = "MIT"
  gem.summary = %Q{The Ruby Pegex Parser Generator}
  gem.description = %Q{Pegex is a Acmeist parser framework. It combines a PEG parser grammar syntax, with PCRE compatible Regular Expressions as the match tokens. Pegex draws heavily from Perl 6 Rules, and works equivalently in many modern programming languages.  With Pegex you can easily define new mini languages that can be equally compiled in many programming languages. ( from http://pegex.org )}
  gem.email = "pegex@sharpsaw.org"
  gem.authors = %w(rking ingy)
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

# TODO - https://github.com/colszowka/simplecov
#require 'rcov/rcovtask'
#Rcov::RcovTask.new do |test|
#  test.libs << 'test'
#  test.pattern = 'test/**/test_*.rb'
#  test.verbose = true
#  test.rcov_opts << '--exclude "gems/*"'
#end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "pegex-rb #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
