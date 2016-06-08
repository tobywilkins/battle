require 'sinatra/base'

class Battle < Sinatra::Base
  require './lib/game'
  require './lib/player'

  enable :sessions
  set :session_secret, 'Secret Session'

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player1]),Player.new(params[:player2]))
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  post '/attack' do
    @game = $game
    @game.attack
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
