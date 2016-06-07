require 'sinatra/base'
require_relative './lib/player_model'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, "My session secret"

  get '/' do
    'This is a battle app!'
    erb(:login)
  end

  post '/names' do
    $player1 = Player.new(params[:Player1]).name
    $player2 = Player.new(params[:Player2]).name
    session[:message] = nil
    redirect '/play'
  end

  get '/play' do
    # @Player_1 = session[:Player1]
    # @Player_2 = session[:Player2]
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
