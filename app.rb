require 'sinatra/base'

class Battle < Sinatra::Base
  require './lib/game'
  require './lib/player'
  require './lib/attack_generator'

  enable :sessions
  set :session_secret, 'Secret Session'

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game = Game.create(Player.new(params[:player1]),Player.new(params[:player2]))
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    AttackGenerator.run(@game.inactive_player)
    @game.set_last_action("Attack")
    if @game.inactive_player.hitpoints <= 0
      redirect'/win'
    else
    redirect '/play'
    end
  end

  post '/paralyze' do
    ParalysisGenerator.run(@game.inactive_player)
  end

  post '/end_turn' do
    @game.switch_turn
    @game.set_last_action(nil)
    redirect '/play'
  end

  get '/win' do
    erb(:win)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
