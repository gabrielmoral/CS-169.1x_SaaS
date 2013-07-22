class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
	winner = nil

	if m1[1].downcase == "p" and m2[1].downcase == "s"
		winner = m2
	elsif m1[1].downcase == "p" and m2[1].downcase == "r"
		winner = m1
	elsif m1[1].downcase == "s" and m2[1].downcase == "r"
		winner = m2
	elsif m1[1].downcase == "s" and m2[1].downcase == "p"
		winner = m1
	elsif m1[1].downcase == "r" and m2[1].downcase == "p"
		winner = m2
	elsif m1[1].downcase == "r" and m2[1].downcase == "s"
		winner = m1
	else
		winner = m1
	end

	return winner
end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	check_hand_value(game)

	return rps_result(game[0], game[1])
end

def check_hand_value(game)
	game_value =["r", "p", "s"]

	game.each do |player|
		if !game_value.include? player[1].downcase	
			raise NoSuchStrategyError
		end
	end
end

def rps_tournament_winner(tournament)	
	if tournament[0][1].is_a?(String)
		return rps_game_winner(tournament)			
	else		
	    a1 = rps_tournament_winner(tournament[0])
	    a2 = rps_tournament_winner(tournament[1])
	    return rps_tournament_winner([a1,a2])	
	end
end