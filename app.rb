require 'bundler'
Bundler.require

require 'sinatra'
require 'sinatra/activerecord'
require 'action_view'

%w[policies models routes services].each do |folder_name|
  Dir.glob("./#{folder_name}/*.rb") { |f| require f }
  Dir.glob("./#{folder_name}/**/*.rb") { |f| require f }
end

class App < Sinatra::Base
  set :views,         File.expand_path(File.join(__FILE__, '../views'))
  set :public_folder, File.expand_path(File.join(__FILE__, '../public'))

  helpers ActionView::Helpers::AssetTagHelper

  register Sinatra::ActiveRecordExtension
end
