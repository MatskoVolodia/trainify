require 'bundler'
Bundler.require

require 'sinatra'
require 'sinatra/activerecord'
require 'action_view'

%w[policies models routes services presenters helpers].each do |folder_name|
  Dir.glob("./#{folder_name}/*.rb") { |f| require f }
  Dir.glob("./#{folder_name}/**/*.rb") { |f| require f }
end

class App < Sinatra::Base
  set :views,         File.expand_path(File.join(__FILE__, '../views'))
  set :public_folder, File.expand_path(File.join(__FILE__, '../public'))

  enable :sessions

  helpers ActionView::Helpers::AssetTagHelper,
          ActionView::Helpers::UrlHelper,
          AuthHelper

  register Sinatra::ActiveRecordExtension

  use Warden::Manager do |config|
    config.serialize_into_session{ |user| user.id }
    config.serialize_from_session{ |id| User.find(id) }

    config.scope_defaults :default,
      strategies: [:password],
      action: UNAUTHENTICATED_URL

    config.failure_app = self
  end

  AuthenticationService::InitAuthentication.call
end
