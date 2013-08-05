# encoding: utf-8
require "rails_country_select/version"
require File.expand_path('../country_definitions', __FILE__)

if defined?(Rails) && defined?(ActionView)
  module ActionView
    module Helpers
      autoload :CountryHelper, 'rails_country_select/helpers/rails_country_select'
      module FormOptionsHelper
        def country_select(object, method, options = {}, html_options = {})
          options[:keys]    = :names unless options.has_key?(:keys)
          options[:values]  = :nums  unless options.has_key?(:values)

          potential = {
              :names   => COUNTRY_NAMES,
              :nums    => COUNTRY_NUMS,
              :alpha2s => COUNTRY_ALPHA2S,
              :alpha3s => COUNTRY_ALPHA3S
          }

          select_options = potential[options[:keys]].zip(potential[options[:values]])
          InstanceTag.new(object, method, self, options.delete(:object)).to_select_tag(select_options, options, html_options)
        end
      end

      class FormBuilder
        def country_select(method, options = {}, html_options = {})
          @template.country_select(@object_name, method, options.merge({:object => @object}), html_options)
        end
      end

      # get country info given some params
      def country(options = {:name => "", :num =>"", :alpha2s => "", :alpha3s => ""})
        result = []
        COUNTRY_NUMS.zip(COUNTRY_NAMES, COUNTRY_ALPHA2S, COUNTRY_ALPHA3S).each do |country|
          if options[:nums].to_i.eql?(country[0]) || options[:name].eql?(country[1]) || options[:alpha2s].eql?(country[2]) || options[:alpha3s].eql?(country[3])
            result = country
          end
        end
        result
      end
    end
  end
end

