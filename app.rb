require 'sinatra/base'
require 'json'

class App < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/public'

  get "/" do
    secrets_base_dir = ENV["SECRETS_BASE_DIR"]
    secrets_base_dir ||= "/tmp/secrets"
    erb :index, locals: {secrets_base_dir: secrets_base_dir}
  end
end
