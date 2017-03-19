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

		case session[:player1]
		when 'Human'
			session[:player1] = Human.new('X')
		when 'Easy'
			session[:player1] = Sequential.new('X')
		when 'Medium'
			session[:player1] = RandomAI.new('X')
		when 'Impossible!'
			session[:player1] = UnbeatableAI.new('X')
		else
			redirect '/'
		end

		case session[:player2]
		when 'Human'
			session[:player2] = Human.new('O')
		when 'Easy'
			session[:player2] = Sequential.new('O')
		when 'Medium'
			session[:player2] = RandomAI.new('O')
		when 'Impossible!'
			session[:player2] = UnbeatableAI.new('O')
		else
			redirect '/'
		end
		

	end

	#erb :main_board, :locals => {player1: session[:player1], player2: session[:player2], board: session[:board]}


# end
