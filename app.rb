require 'bundler'
Bundler.require

require 'sinatra'
require 'sinatra/activerecord'

Dir.glob('./operations/*.rb') { |file| require file }
Dir.glob('./policies/*.rb') { |file| require file }
Dir.glob('./models/*.rb') { |file| require file }
Dir.glob('./routes/*.rb') { |file| require file }

class App < Sinatra::Base
  set :views, File.expand_path(File.join(__FILE__, '../views'))
  set :public_folder, File.expand_path(File.join(__FILE__, '../public'))

  register Sinatra::ActiveRecordExtension
end