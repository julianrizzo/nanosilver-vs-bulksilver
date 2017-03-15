require './application.rb'
require 'sass/plugin/rack'
require './web'

Sass::Plugin.options[:style] = :compressed
Sass::Plugin.options[:css_location] = "./app/assets/stylesheets"
use Sass::Plugin::Rack

run App