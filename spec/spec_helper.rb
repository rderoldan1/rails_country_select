require 'rubygems'
require 'bundler/setup'
require 'coveralls'

Coveralls.wear! 'rails'

require File.expand_path('../../lib/rails_country_select', __FILE__)
require File.expand_path('../../lib/country_definitions', __FILE__)

RSpec.configure do |config|
end
