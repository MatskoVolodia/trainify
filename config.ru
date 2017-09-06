require './app'
require 'rubygems'
require 'uglifier'


require 'sass/plugin/rack'
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run App