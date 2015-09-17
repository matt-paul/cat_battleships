require 'sinatra/base'
require_relative '../game_setup.rb'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = Player.new
    @player.name = params[:name]
    erb :new_game
  end

  get '/start_game' do
    @board = Board.new(Cell).to_html

    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  set :views, proc { File.join(root, '..', 'views') }
  #Apparently this is the place to link to stylesheets ??? Not currently working!
  # set :styles, proc { File.join(root, '..', 'styles/styles.css') }
end
