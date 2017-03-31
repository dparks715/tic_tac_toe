require 'sinatra'
require_relative 'board_app.rb'
require_relative 'unbeatable_app.rb'
require_relative 'classes_app.rb'

enable :sessions


# class TicTacToe < Sinatra::Base

	get '/' do
		session[:board] = Board.new
		erb :welcome, :locals => {board: session[:board]}

	end

	post '/select_players' do
		session[:player1_type] = params[:player1]
		session[:player2_type] = params[:player2]
		session[:human1] = 'no'
		session[:human2] = 'no'

		if session[:player1_type] == 'Human'
			session[:player1] = Human.new('X')
			session[:human1] = 'yes'

		elsif session[:player1_type] == 'Easy'
			session[:player1] = Sequential.new('X')

		elsif session[:player1_type] == 'Medium'
			session[:player1] = RandomAI.new('X')

		elsif session[:player1_type] == 'Impossible!'
			session[:player1] = UnbeatableAI.new('X')
		else
			redirect '/'
		end

		if session[:player2_type] == 'Human'
			session[:player2] = Human.new('O')
			session[:human2] = 'yes'

		elsif session[:player2_type] == 'Easy'
			session[:player2] = Sequential.new('O')

		elsif session[:player2_type] == 'Medium'
			session[:player2] = RandomAI.new('O')

		elsif session[:player2_type] == 'Impossible!'
			session[:player2] = UnbeatableAI.new('O')
		else
			redirect '/'
		end

		session[:active_player] = session[:player1]

		if session[:human1] == 'yes'
			redirect '/board'
		else
			redirect '/make_move'
		end
	end

	get '/board' do

		erb :main_board, :locals => {player1: session[:player1], player2: session[:player2], active_player: session[:active_player].marker, board: session[:board]}

	end

	get '/make_move' do

		move = session[:active_player].get_move(session[:board].ttt_board)
		session[:board].update_position(move, session[:active_player].marker)

		redirect '/check_game_state'

	end

	post '/human_move' do

		move = params[:choice].to_i - 1

		if session[:board].valid_position?(move)
			session[:board].update_position(move, session[:active_player].marker)
			redirect '/check_game_state'
		else
		 	redirect '/board'
		end

	end

	get '/check_game_state' do

		if session[:board].winner?(session[:active_player].marker)

			message = "#{session[:active_player].marker} is the winner!"

			erb :game_over, :locals => {board: session[:board], message: message}
		
		elsif session[:board].full_board?

			message = "The game is a tie!"
		
			erb :game_over, :locals => {board: session[:board], message: message}
		
		else
			redirect '/change_player'
		end

	end

	get '/change_player' do

		if session[:active_player] == session[:player1]
			session[:active_player] = session[:player2]
		else
			session[:active_player] = session[:player1]
		end

		if session[:active_player] == session[:player1] && session[:human1] == 'yes' || session[:active_player] == session[:player2] && session[:human2] == 'yes'
			redirect '/board'
		else
			redirect '/make_move'
		end

	end

# end
