require 'bundler'
Bundler.require

require 'sinatra'
require "sinatra/activerecord"

Dir.glob('./models/*.rb') { |file| require file }

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    p 'Hello conflict 2'

    slim :index
  end
end
