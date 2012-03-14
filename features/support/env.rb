require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

STDOUT = $stdout = StringIO.new
STDERR = $stderr = StringIO.new

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'rubychan'

require 'rspec/expectations'
