ENV['NODE_ENV'] = ENV['RAILS_ENV'] = 'test'

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'byebug'
require 'minitest/autorun'

require 'pathname'

require 'jass-vue-sfc'

Nodo.logger = Object.new.instance_exec do
  def errors; @errors ||= []; end
  def error(msg); errors << msg; end
  def clear!; @errors = []; end
  self
end
