require 'sinatra'
require_relative 'board.rb'
require_relative 'unbeatable.rb'
require_relative 'player_classes.rb'

enable :sessions


# class TicTacToe < Sinatra::Base

	get '/' do
		session[:board] = Board.new
		erb :welcome, :locals => {board: session[:board]}

	end

	post '/select_players' do
		session[:player1] = params[:player1]
		session[:player2] = params[:player2]

		if session[:player1] == 'Human'
			session[:player1] = Human.new('X')
			session[:human1] = 'yes'

		elsif session[:player1] == 'Easy'
			session[:player1] = Sequential.new('X')

		elsif session[:player1] == 'Medium'
			session[:player1] = RandomAI.new('X')

		elsif session[:player1] == 'Impossible!'
			session[:player1] = UnbeatableAI.new('X')
		else
			redirect '/'
		end

		if session[:player2] == 'Human'
			session[:player2] = Human.new('O')
			session[:human2] = 'yes'

		elsif session[:player2] == 'Easy'
			session[:player2] = Sequential.new('O')

		elsif session[:player2] == 'Medium'
			session[:player2] = RandomAI.new('O')

		elsif session[:player2] == 'Impossible!'
			session[:player2] = UnbeatableAI.new('O')
		else
			redirect '/'
		end

		session[:active_player] = params[:player1]

		if session[:human1] == 'yes'
			redirect '/board'
		else
			redirect '/make_move'
		end
	end

	get '/board' do

		erb :main_board, :locals => {player1: session[:player1], player2: session[:player2], active_player: session[:active_player], board: session[:board]}

	end

	get '/make_move' do

		move = session[:active_player].get_move(session[:board])

		redirect '/board'

	end

	post '/human_move' do

		choice = params[:choice].to_i

		if session[:board].valid_position?(choice)
			session[:board].update_position(choice, session[:active_player].marker)
			redirect '/board'
		else
			redirect '/board'
		end
	end


# end
