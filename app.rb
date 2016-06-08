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
    $player1 = Player.new(params[:Player1])
    $player2 = Player.new(params[:Player2])
    session[:message] = nil
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player1.name
    @player_2 = $player2.name
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
