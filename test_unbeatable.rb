require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatableAI < Minitest::Test

	def test_marker
		newAI = UnbeatableAI.new('X')
		assert_equal('X', newAI.marker)		
	end

	def test_go_for_win
		newAI = UnbeatableAI.new('X')
		assert_equal(2, newAI.win_block(['X', 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ']))
	end

	def test_go_for_win_345
		newAI = UnbeatableAI.new('X')
		assert_equal(4, newAI.win_block([' ', ' ', ' ', 'X', ' ', 'X', ' ', ' ', ' ']))
	end

	def test_go_for_win_678
		newAI = UnbeatableAI.new('X')
		assert_equal(8, newAI.win_block([' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', ' ']))
	end

	def test_go_for_win_246
		newAI = UnbeatableAI.new('X')
		assert_equal(6, newAI.win_block([' ', ' ', 'X', ' ', 'X', ' ', ' ', ' ', ' ']))
	end

	def test_go_for_win_246_O
		newAI = UnbeatableAI.new('O')
		assert_equal(6, newAI.win_block([' ', ' ', 'O', ' ', 'O', ' ', ' ', ' ', ' ']))
	end

	def test_go_for_win_678_O
		newAI = UnbeatableAI.new('O')
		assert_equal(8, newAI.win_block([' ', ' ', ' ', ' ', ' ', ' ', 'O', 'O', ' ']))
	end

	#BLOCK TESTS

	def test_for_block_O_win
		newAI = UnbeatableAI.new('X')
		assert_equal(1, newAI.win_block(['O', ' ', 'O', 'X', ' ', ' ', ' ', ' ', ' ']))	
	end

	def test_for_block_O_win_345
		newAI = UnbeatableAI.new('X')
		assert_equal(4, newAI.win_block([' ', ' ', 'X', 'O', ' ', 'O', ' ', ' ', ' ']))	
	end

	def test_for_block_O_win_678
		newAI = UnbeatableAI.new('X')
		assert_equal(7, newAI.win_block([' ', ' ', 'X', ' ', ' ', ' ', 'O', ' ', 'O']))	
	end

	def test_for_block_X_win_678
		newAI = UnbeatableAI.new('O')
		assert_equal(7, newAI.win_block([' ', ' ', 'O', ' ', ' ', ' ', 'X', ' ', 'X']))	
	end

	def test_for_block_X_win_246
		newAI = UnbeatableAI.new('O')
		assert_equal(6, newAI.win_block(['X', ' ', 'X', ' ', 'X', 'O', ' ', 'X', 'O']))	
	end

	def test_no_block_no_win
		newAI = UnbeatableAI.new('O')
		assert_equal(1, newAI.win_block(['X', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ']))	
	end

	# FORK TESTS

	def test_X_takes_fork
		newAI = UnbeatableAI.new('X')
		assert_equal(4, newAI.check_for_fork(['X', 'O', ' ', 'O', ' ', ' ', 'X', ' ', ' ']))
	end

	def test_O_fork_returns_zero
		newAI = UnbeatableAI.new("O")
		assert_equal(0, newAI.check_for_fork([" ", "O", " ", " ", "O", "X", " ", "X", " "]))
	end

	def test_O_fork_returns_six
		newAI = UnbeatableAI.new("O")
		assert_equal(6, newAI.check_for_fork([" ", "X", " ", " ", "O", "X", " ", "O", " "]))
	end

	def test_O_fork_returns_two
		newAI = UnbeatableAI.new("O")
		assert_equal(2, newAI.check_for_fork(["X", " ", " ", " ", " ", " ", "O", "X", "O"]))
	end

	#BLOCK FORK TESTS

	def test_X_blocks_fork
		newAI = UnbeatableAI.new('X')
		assert_equal(4, newAI.block_fork(['O', 'X', ' ', 'X', ' ', ' ', 'O', ' ', ' ']))
	end

	def test_O_fork_blocks_zero
		newAI = UnbeatableAI.new("O")
		assert_equal(0, newAI.block_fork([" ", "X", " ", " ", "X", "O", " ", "O", " "]))
	end

	def test_O_fork_block_six
		newAI = UnbeatableAI.new("O")
		assert_equal(6, newAI.block_fork([" ", "O", " ", " ", "X", "O", " ", "X", " "]))
	end

	def test_O_fork_block_two
		newAI = UnbeatableAI.new("O")
		assert_equal(2, newAI.block_fork(["O", " ", " ", " ", " ", " ", "X", "O", "X"]))
	end

	def test_O_blocks_X_corners
		newAI = UnbeatableAI.new("O")
		assert_equal(3, newAI.block_fork([" ", " ", "X", " ", "O", " ", "X", " ", " "]))
	end

	def test_O_blocks_X_corners_opposite
		newAI = UnbeatableAI.new("O")
		assert_equal(3, newAI.block_fork(["X", " ", " ", " ", "O", " ", " ", " ", "X"]))
	end

	def test_X_blocks_O_corners
		newAI = UnbeatableAI.new("X")
		assert_equal(3, newAI.block_fork([" ", " ", "O", " ", "X", " ", "O", " ", " "]))
	end

	def test_X_blocks_O_corners_opposite
		newAI = UnbeatableAI.new("X")
		assert_equal(3, newAI.block_fork(["O", " ", " ", " ", "X", " ", " ", " ", "O"]))
	end

	# CENTER TESTS

	def test_X_takes_center
		newAI = UnbeatableAI.new("X")
		assert_equal(4, newAI.take_center([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	def test_O_takes_center
		newAI = UnbeatableAI.new("O")
		assert_equal(4, newAI.take_center([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	def test_X_takes_center_fail
		newAI = UnbeatableAI.new("X")
		assert_equal(10, newAI.take_center([" ", " ", " ", " ", "O", " ", " ", " ", " "]))
	end

	def test_O_takes_center_fail
		newAI = UnbeatableAI.new("O")
		assert_equal(10, newAI.take_center([" ", " ", " ", " ", "X", " ", " ", " ", " "]))
	end

	def test_X_takes_center_various_fills
		newAI = UnbeatableAI.new("X")
		assert_equal(4, newAI.take_center(["X", "X", " ", " ", " ", "O", "O", " ", " "]))
	end

	# OPPOSITE CORNER TESTS

	def test_X_takes_8_when_O1
		newAI = UnbeatableAI.new("X")
		assert_equal(8, newAI.opposite_corner(["O", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	def test_X_takes_6_when_O2
		newAI = UnbeatableAI.new("X")
		assert_equal(6, newAI.opposite_corner([" ", " ", "O", " ", " ", " ", " ", " ", " "]))
	end

	def test_X_takes_2_when_O6
		newAI = UnbeatableAI.new("X")
		assert_equal(2, newAI.opposite_corner([" ", " ", " ", " ", " ", " ", "O", " ", " "]))
	end

	def test_X_takes_0_when_O_0
		newAI = UnbeatableAI.new("X")
		assert_equal(0, newAI.opposite_corner([" ", " ", " ", " ", " ", " ", " ", " ", "O"]))
	end

	def test_O_takes_8_when_X1
		newAI = UnbeatableAI.new("O")
		assert_equal(8, newAI.opposite_corner(["X", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	def test_O_takes_6_when_X2
		newAI = UnbeatableAI.new("O")
		assert_equal(6, newAI.opposite_corner([" ", " ", "X", " ", " ", " ", " ", " ", " "]))
	end

	def test_O_takes_2_when_X6
		newAI = UnbeatableAI.new("O")
		assert_equal(2, newAI.opposite_corner([" ", " ", " ", " ", " ", " ", "X", " ", " "]))
	end

	def test_O_takes_0_when_X_0
		newAI = UnbeatableAI.new("O")
		assert_equal(0, newAI.opposite_corner([" ", " ", " ", " ", " ", " ", " ", " ", "X"]))
	end

	def test_O_fails_to_corner
		newAI = UnbeatableAI.new("O")
		assert_equal(10, newAI.opposite_corner(["X", " ", "X", " ", " ", " ", "X", " ", "X"]))
	end

	def test_O_takes_8
		newAI = UnbeatableAI.new("O")
		assert_equal(8, newAI.opposite_corner(["X", "O", "O", " ", "X", "O", "O", " ", " "]))
	end

	# EMPTY CORNER TESTS

	def test_O_takes_first_empty_corner
		newAI = UnbeatableAI.new("O")
		assert_equal(0, newAI.empty_corner([" ", " ", "X", " ", "O", " ", "X", "O", "X"]))
	end

	def test_O_takes_second_empty_corner
		newAI = UnbeatableAI.new("O")
		assert_equal(2, newAI.empty_corner(["O", " ", " ", " ", "O", " ", "X", "O", "X"]))
	end

	def test_O_takes_6_empty_corner
		newAI = UnbeatableAI.new("O")
		assert_equal(6, newAI.empty_corner(["O", " ", "X", " ", "O", " ", " ", "O", "X"]))
	end

	def test_O_takes_8_empty_corner
		newAI = UnbeatableAI.new("O")
		assert_equal(8, newAI.empty_corner(["O", " ", "X", " ", "O", " ", "X", "O", " "]))
	end

	def test_O_empty_board_first_corner
		newAI = UnbeatableAI.new("O")
		assert_equal(0, newAI.empty_corner([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	# SIDES TESTS

	def test_O_takes_top_side
		newAI = UnbeatableAI.new("O")
		assert_equal(1, newAI.empty_side(["X", " ", "X", " ", "O", " ", " ", "O", "X"]))
	end

	def test_O_takes_left_side
		newAI = UnbeatableAI.new("O")
		assert_equal(3, newAI.empty_side(["O", "X", " ", " ", "O", " ", "X", "O", "X"]))
	end

	def test_O_takes_right_side
		newAI = UnbeatableAI.new("O")
		assert_equal(5, newAI.empty_side([" ", "O", "X", "X", "O", " ", "X", "O", "X"]))
	end

	def test_O_takes_bottom_side
		newAI = UnbeatableAI.new("O")
		assert_equal(7, newAI.empty_side(["O", "O", " ", "X", " ", "X", "O", " ", "X"]))
	end

	def test_O_empty_board_top_side
		newAI = UnbeatableAI.new("O")
		assert_equal(1, newAI.empty_side([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

end