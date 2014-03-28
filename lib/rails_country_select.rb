# encoding: utf-8
require "rails_country_select/version"
require File.expand_path('../country_definitions', __FILE__)

#if defined?(Rails) && defined?(ActionView)
	  module ActionView
    module Helpers
      autoload :CountryHelper, 'rails_country_select/helpers/rails_country_select'
      module FormOptionsHelper
        def country_select(object, method, options = {}, html_options = {})
          options[:keys]    = :names unless options.has_key?(:keys)
          options[:values]  = :nums  unless options.has_key?(:values)

          potential = {
              :names   => translate_countries,
              :nums    => COUNTRY_NUMS,
              :alpha2s => COUNTRY_ALPHA2S,
              :alpha3s => COUNTRY_ALPHA3S
          }
          #options = options.delete(:object)
          select_options = potential[options[:keys]].zip(potential[options[:values]])
          select_tag(method, options_for_select(select_options),options,html_options)
          #Tags::Select.new(object, method, self, select_options, options, html_options)
        end
      end

      class FormBuilder
        def country_select(method, options = {}, html_options = {})
          @template.country_select(@object_name, method, options, html_options)
        end
      end

      # get country info given some params
      def country(options = {:name => "", :num =>"", :alpha2s => "", :alpha3s => ""})
        result = []
        COUNTRY_NUMS.zip(translate_countries, COUNTRY_ALPHA2S, COUNTRY_ALPHA3S).each do |country|
          if find_country(options, country)
           result = country
          end
        end
        result
      end

      #get country name
      def country_name(options = {:name => "", :num =>"", :alpha2s => "", :alpha3s => ""})
        country(options)[1]
      end

      #get country cod
      def country_cod(options = {:name => "", :num =>"", :alpha2s => "", :alpha3s => ""})
        country(options)[0]
      end

      #get country alpha2s
      def country_alpha2s(options = {:name => "", :num =>"", :alpha2s => "", :alpha3s => ""})
        country(options)[2]
      end

      #get country alpha3s
      def country_alpha3s(options = {:name => "", :num =>"", :alpha2s => "", :alpha3s => ""})
        country(options)[3]
      end

      private
      def translate_countries
        COUNTRY_ALPHA2S.zip(COUNTRY_NAMES).map do |code, name|
          I18n.t(code, :scope => :countries, :default => name)
        end
      end

      def find_country(options, country)
        options[:num].to_i.eql?(country[0]) || options[:name].eql?(country[1]) || options[:alpha2s].eql?(country[2]) || options[:alpha3s].eql?(country[3])
      end
    end
  end
#end

