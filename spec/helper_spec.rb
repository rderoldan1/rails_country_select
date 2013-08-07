require 'rspec'


require 'action_view'
require 'action_view/helpers'
require 'i18n'

include ActionView::Helpers
describe 'Helper methods' do

  it 'should find country name' do
    a = country_name(:num => "170")
    a.class.should be String
    a.should eq "Colombia"
    a.should_not be_nil
  end

  it 'should find country alpha2s' do
    a = country_alpha2s(:num => "170")
    a.class.should be String
    a.should eq "CO"
    a.should_not be_nil
  end

  it 'should find country alpha3s' do
    a = country_alpha3s(:num => "170")
    a.class.should be String
    a.should eq "COL"
    a.should_not be_nil
  end

  it 'should find country number' do
    a = country_cod(:name => "Colombia")
    a.class.should be Fixnum
    a.should eq 170
    a.should_not be_nil
  end

  it 'should find country info' do
    a = country(:name => "Colombia")
    a.class.should be Array
    a.count.should eq 4
    a[0].should eq 170
    a[0].class.should eq Fixnum
    a.should_not be_nil
  end
end