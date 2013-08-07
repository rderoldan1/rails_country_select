# RailsCountrySelect
[![Gem Version](https://badge.fury.io/rb/rails_country_select.png)](http://badge.fury.io/rb/rails_country_select) [![Code Climate](https://codeclimate.com/github/rderoldan1/rails_country_select.png)](https://codeclimate.com/github/rderoldan1/rails_country_select) [![Build Status](https://travis-ci.org/rderoldan1/rails_country_select.png?branch=master)](https://travis-ci.org/rderoldan1/rails_country_select) [![Coverage Status](https://coveralls.io/repos/rderoldan1/rails_country_select/badge.png?branch=master)](https://coveralls.io/r/rderoldan1/rails_country_select?branch=master)

Rails 3 gem for Select tag in order to choose a country in your forms, provides 4 options.

*This project is based on Rails 2 plugin created by LukeCarrier [rails-country-select](https://github.com/rderoldan1/rails-country-select/blob/master/lib/country_definitions.rb)*

1. Country Name.
2. Cod
3. ISO cod 2 chars ('CO', 'AF', 'AX', 'AL')
4. ISO cod 3 chars ('COL', 'AFG', 'ALA', ALB')

Also includes a Helper method in order to get all country info.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_country_select'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_country_select

## Usage

### Basic
* value : country cod number
* text  : country name

```rails
<%= form_for @user do |f| %>
    <%= f.country_select :country %>
<% end %>
```

HTML generated
```html
 <select id="user_country" name="user[country]">
    <option value="4">Afghanistan</option>
    <option value="248">Albania</option>
    <option value="8">Ãland Islands</option>
    <option value="12">Algeria</option>
```

### Advanced
* values, keys : [:names, :nums, :alpha2s, :alpha3s]
* selected      : set default value
* prompt       : message

```rails
<%= form_for @user do |f| %>
    <%= f.country_select :country, {:keys => :names, :values => :alpha2s, :selected => "CO"}, :prompt => "Choose a country"
<% end %>
```

HTML generated

```html
<select id="user_country" name="user[country]" prompt="Choose a country" value="CO">
    <option value="AF">Afghanistan</option>
    <option value="AL">Albania</option>
    <option value="AX">Ãland Islands</option>
    <option value="DZ">Algeria</option>
```


### Show country info in array
A helper method is available to get all the country info in the views, it return an array, the usage is.

Find by name
```ruby
country(:name => "Colombia")
[170, "Colombia", "CO", "COL"]
```

Find by Cod
```ruby
country(:num => 12)
[12, "Algeria", "DZ", "DZA"]
```

Find by Alpha2s
```ruby
country(:alpha2s => "AR")
[32, "Argentina", "AR", "ARG"]
```

Find by Alpha3s
```ruby
country(:alpha3s => "USA")
[840, "United States", "US", "USA"]
```

Also you can mix all the options hash, example
```ruby
country(:alpha3s => "USA", :alpha2s => "US", :num => 840, :name => "United States")
[840, "United States", "US", "USA"]
```

#### Show specific country info
All the methods receive a hash options :name, :cod, :alpha2s, :alpha3s
```ruby
country_name :num => "170"
=> "Colombia"

country_cod :name => "Colombia"
=> 170
country_alpha2s :num => "170"
=> "CO"

country_alpha3s :num => "170"
=> "COL"
```

#### Usage in views

Assuming that your User model store country cod.
```rails
<p>Country Cod: <%= country(:num => @user.country_num)[0] %><p>
<p>Country Name: <%= country(:num => @user.country_num)[1] %><p>
<p>Country Apha2s: <%= country(:num => @user.country_num)[2] %><p>
<p>Country Apha3s: <%= country(:num => @user.country_num)[3] %><p>

<p>Country Cod: <%= country_cod(:num => @user.country_num) %><p>
<p>Country Name: <%= country_name(:num => @user.country_num) %><p>
<p>Country Apha2s: <%= country_alpha2s(:num => @user.country_num) %><p>
<p>Country Apha3s: <%= country_alpha3s(:num => @user.country_num) %><p>

```

### Locales

By default all county names are in english, but you can change this behavior by include country names in
your locale file under `countries:` scope

```yml
es:
 countries:
    AC: "Isla de la Ascensión"
    AD: "Andorra"
    AE: "Emiratos Árabes Unidos"
    AF: "Afganistán"
    AG: "Antigua y Barbuda"
    AI: "Anguila"
    AL: "Albania"
    AM: "Armenia"
```

Please look at [@onomojo](https://github.com/onomojo) [repo](https://github.com/onomojo/i18n-country-translations/tree/master/rails/locale) for all translations




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
