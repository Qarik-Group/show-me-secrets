require 'sinatra/base'

class App < Sinatra::Base
  get "/" do
    "hello world"
  end
end
