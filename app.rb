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
    game = Game.build(params[:Player1],params[:Player2])
    Game.store_game(game)
    session[:message] = nil
    redirect '/play'
  end

  post '/single' do
    game = Game.build(params[:Player],params[:AI])
    Game.store_game(game)
    session[:message] = nil
    redirect '/play'
  end

  get '/ai' do
    session[:message] = Game.game.attack("attack")
    redirect '/lose' if session[:message].split.last == 'loses'
    redirect '/play'
  end

  get '/lose' do
    @status = session[:message]
    erb(:lost)
  end

  get '/play' do
    @game = Game.game
    @status = session[:message]
    redirect '/ai' if @game.player_turn.name == "Capybara"
    erb(:play)
  end

  post '/attack' do
    session[:message] = Game.game.attack(params[:attack])
    redirect '/lose' if session[:message].split.last == 'loses'
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
