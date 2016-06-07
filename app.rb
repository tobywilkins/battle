require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, "My session secret"

  get '/' do
    'This is a battle app!'
    erb(:login)
  end

  post '/names' do
    session[:Player1] = params[:Player1]
    session[:Player2] = params[:Player2]
    session[:message] = nil
    redirect '/play'
  end

  get '/play' do
    @Player_1 = session[:Player1]
    @Player_2 = session[:Player2]
    @status = session[:message]
    erb(:play)
  end
   post '/attack' do 
   	p params
   	session[:message] = "#{params[:target]} got attacked"
   	redirect '/play'
   end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
