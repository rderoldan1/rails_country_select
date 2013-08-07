require 'rspec'
require 'spec_helper'

describe 'ActionView' do
  it 'should include helper tag methods' do
    ActionView::Helpers::FormOptionsHelper.instance_methods.include?(:country_select).should be true
    ActionView::Helpers::FormBuilder.instance_methods.include?(:country_select).should be true
  end

  it 'fail test' do
    user = double("user")
    expect { country_select(user, :name)}.to raise_error
  end
end

