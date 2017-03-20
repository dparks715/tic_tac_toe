require 'minitest/autorun'
require_relative '../classes_app.rb'

class TestSequentialAI < Minitest::Test

	def test_ai_picks_first_pos
		ai = Sequential.new('O')
		assert_equal(0, ai.get_move([1,2,3,4,5,6,7,8,9]))
	end

	def test_ai_picks_second_pos
		ai = Sequential.new('O')
		assert_equal(1, ai.get_move(['X',2,3,4,5,6,7,8,9]))
	end

	def test_ai_picks_third_pos
		ai = Sequential.new('O')
		assert_equal(2, ai.get_move(['X', 'X',3,4,5,6,7,8,9]))
	end

	def test_ai_picks_fourth_pos
		ai = Sequential.new('O')
		assert_equal(3, ai.get_move(['X', 'X', 'O',4,5,6,7,8,9]))
	end

	def test_ai_picks_fifth_pos
		ai = Sequential.new('O')
		assert_equal(4, ai.get_move(['X', 'X', 'd', 'f',4,5,6,7,8,9]))
	end

	def test_ai_picks_sixth_pos
		ai = Sequential.new('O')
		assert_equal(5, ai.get_move(['X', 'X', '4', 'f', 'd',6,7,8,9]))
	end

end