class Human

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board_state)
		print 'Enter 0-8 to choose your square: '
		move = gets.chomp.to_i
	end
		
end