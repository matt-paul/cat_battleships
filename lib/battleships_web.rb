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

    @patrol_boat = Ship.new(1)
    if params[:p_coordinates] && params[:p_orientation]
      $board.place(@patrol_boat,params[:p_coordinates].to_sym, params[:p_orientation].to_sym )
    end

    @submarine = Ship.new(2)
    if params[:s_coordinates] && params[:s_orientation]
      $board.place(@submarine,params[:s_coordinates].to_sym, params[:s_orientation].to_sym )
    end

    @destroyer = Ship.new(3)
    if params[:d_coordinates] && params[:d_orientation]
      $board.place(@destroyer,params[:d_coordinates].to_sym, params[:d_orientation].to_sym )
    end

    @battleship = Ship.new(4)
    if params[:b_coordinates] && params[:b_orientation]
      $board.place(@battleship,params[:b_coordinates].to_sym, params[:b_orientation].to_sym )
    end

    @carrier = Ship.new(5)
    if params[:c_coordinates] && params[:c_orientation]
      $board.place(@carrier,params[:c_coordinates].to_sym, params[:c_orientation].to_sym )
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
