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

	post '/game' do
		session[:player1] = params[:player1]
		session[:player2] = params[:player2]
		erb :main_board, :locals => {player1: session[:player1], player2: session[:player2], board: session[:board]}

	end


# end
