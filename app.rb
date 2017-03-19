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
		session[:opponent] = params[:opponent]
		erb :main_board, :locals => {opponent: session[:opponent], board: session[:board]}

	end


# end
