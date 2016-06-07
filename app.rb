require 'sinatra/base'

class Catemon < Sinatra::Base
  get '/' do
    'Hello Catemon!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
