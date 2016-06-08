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
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect '/play'
  end

  get '/play' do
    @player1_name = $player1.name
    @player2_name = $player2.name
    @player2_hitpoints = $player2.hitpoints
    erb(:play)
  end

  post '/attack' do
    @player2 = $player2
    Game.new.attack(@player2)
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
