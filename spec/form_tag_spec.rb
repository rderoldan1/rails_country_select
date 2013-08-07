require 'rspec'
require 'spec_helper'

describe 'AtionView' do
  it 'should include helper tag methods' do
    ActionView::Helpers::FormOptionsHelper.instance_methods.include?(:country_select).should be true
    ActionView::Helpers::FormBuilder.instance_methods.include?(:country_select).should be true
  end
end

