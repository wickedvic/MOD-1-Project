require_relative '../config/environment'
require 'pry'
require 'tty-prompt'

puts "hello world"
cli = CLI.new
cli.start
