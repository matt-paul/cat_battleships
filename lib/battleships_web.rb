require 'sinatra/base'
require_relative '../game_setup.rb'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    erb :new_game
  end

  get '/start_game' do
    @board = Board.new(Cell).to_html
    erb :start_game
  end

  get '/start_game' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  set :views, proc { File.join(root, '..', 'views') }
  set :styles, proc { File.join(root, '..', 'styles/styles.css') }
end
