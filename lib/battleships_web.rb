require 'sinatra/base'
require_relative '../game_setup.rb'

class BattleshipsWeb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = Player.new
    @player.name = params[:name]
    $board = Board.new(Cell)
    erb :new_game
  end

  get '/start_game' do
    destroyer = Ship.new(3)
    if params[:coordinates] && params[:orientation]
      session[:coordinates] = params[:coordinates].to_sym
      session[:orientation] = params[:orientation].to_sym
      $board.place(destroyer,params[:coordinates].to_sym, params[:orientation].to_sym )
    end
    if params[:shot_coordinates]
      session[:shot_coordinates] = params[:shot_coordinates].to_sym
      $board.shoot_at(params[:shot_coordinates].to_sym)
    end

    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  set :views, proc { File.join(root, '..', 'views') }
  #Apparently this is the place to link to stylesheets ??? Not currently working!
  # set :styles, proc { File.join(root, '..', 'styles/styles.css') }
end
