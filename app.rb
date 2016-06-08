require 'sinatra/base'
require_relative './lib/player_model'
require_relative './lib/game'


class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, "My session secret"

  get '/' do
    'This is a battle app!'
    erb(:login)
  end

  post '/names' do
    player1 = Player.new(params[:Player1])
    player2 = Player.new(params[:Player2])
    $game = Game.new(player1, player2)
    session[:message] = nil
    redirect '/play'
  end

  get '/play' do
    @game = $game
    @status = session[:message]
    erb(:play)
  end
  post '/attack' do
    session[:message] = $game.attack($game.player2)
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
