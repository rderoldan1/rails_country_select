require 'rubygems'
require 'bundler/setup'
require 'coveralls'

Coveralls.wear! 'rails'

require File.expand_path('../../lib/rails_country_select', __FILE__)
require File.expand_path('../../lib/country_definitions', __FILE__)

require 'action_view'
require 'action_view/helpers'
require 'i18n'

include ActionView::Helpers
include ActionView::Helpers::FormOptionsHelper
include ActionView::Helpers::FormHelper
RSpec.configure do |config|
end
