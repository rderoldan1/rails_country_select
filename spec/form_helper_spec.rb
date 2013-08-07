require 'rspec'
require File.expand_path('../../lib/country_definitions', __FILE__)

describe 'helper' do

  it 'should include countries names' do
    names = COUNTRY_NAMES
    names.class.should be Array
    names.include?("Colombia").should eq true
    names.should_not be nil
  end

  it 'should include countries nums' do
    names = COUNTRY_NUMS
    names.class.should be Array
    names.include?(170).should eq true
    names.should_not be nil
  end

  it 'should include countries alpha 2' do
    names = COUNTRY_ALPHA2S
    names.class.should be Array
    names.include?("CO").should eq true
    names.should_not be nil
  end

  it 'should include countries alpha 3' do
    names = COUNTRY_ALPHA3S
    names.class.should be Array
    names.include?("COL").should eq true
    names.should_not be nil
  end

end