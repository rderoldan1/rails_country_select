# RailsCountrySelect
This project is based on Rails 2 plugin created by LukeCarrier [rails-country-select](https://github.com/rderoldan1/rails-country-select/blob/master/lib/country_definitions.rb)

Select tag in order to choose a country in your forms, provides 4 options.

1. Country Name.
2. Cod
3. ISO cod 2 chars ('CO', 'AF', 'AX', 'AL')
4. ISO cod 3 chars ('COL', 'AFG', 'ALA', ALB')

## Installation

Add this line to your application's Gemfile:

    gem 'rails_country_select'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_country_select

## Usage

### Basic
value : country cod number
text  : country name
```rails
<%= form_for @user do |f| %>
    <%= f.country_select :country %>
<% end %>
```

HTML generated
```html
 <select id="cliente_nacionalidad" name="user[country]">
    <option value="4">Afghanistan</option>
    <option value="248">Albania</option>
    <option value="8">Ãland Islands</option>
    <option value="12">Algeria</option>
```

### Advanced
values, keys : [:names, :nums, :alpha2s, :alpha3s]
selected      : set default value
prompt       : message

```rails
<%= form_for @user do |f| %>
    <%= f.country_select :country, {:keys => :names, :values => :alpha2s, :selected => "CO"}, :prompt => "Choose a country"
<% end %>
```

HTML generated

```html
<select id="cliente_nacionalidad" name="user[country]" prompt="Choose a country" value="CO">
    <option value="AF">Afghanistan</option>
    <option value="AL">Albania</option>
    <option value="AX">Ãland Islands</option>
    <option value="DZ">Algeria</option>
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
