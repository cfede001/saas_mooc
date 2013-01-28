class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  m1 == m2 ? m1 :
  ((m1 =~ %r([P]) and m2 =~ %r([R])) or
   (m1 =~ %r([S]) and m2 =~ %r([P])) or
   (m1 =~ %r([R]) and m2 =~ %r([S]))) ? m1 : m2;
end

def rps_game_winner(game)
  player1 = game[0]
  player2 = game[1]
  p1_move = game[0][1]
  p2_move = game[1][1]

  raise WrongNumberOfPlayersError unless game.flatten.length == 4

  raise NoSuchStrategyError unless
    p1_move =~ %r([RPS]) and p2_move =~ %r([RPS])

  p1_move == rps_result(p1_move, p2_move) ? player1 : player2
end

def rps_tournament_winner(tournament)
  tournament.flatten!
  game, p1, p2, new_tourney = Array.new(0), Array.new(), Array.new(), Array.new()
  i = 0

  while (i < (tournament.length - 3))
     p1, p2, game  = [], [], []
     p1 << tournament[i] << tournament[i+1]
     p2 << tournament[i+2] << tournament[i+3]
     game << p1 << p2
     new_tourney << rps_game_winner(game)
     i+=4
  end

  new_tourney.length > 1 ? rps_tournament_winner(new_tourney) : new_tourney[0]
end

#rps_game_winner( ["Allen", "S"] ) 
#lambda { rps_game_winner([ ["Allen", "S"] ]) }

#x = [ ["Armando", "R"], ["Dave", "S"] ]
#print rps_game_winner(x)
#print "\n"

#x =
#[
#    [
#        [ ["Armando", "P"], ["Dave", "S"] ],
#        [ ["Richard", "R"],  ["Michael", "S"] ],
#    ],
#    [
#        [ ["Allen", "S"], ["Omer", "P"] ],
#        [ ["David E.", "R"], ["Richard X.", "P"] ]
#    ]
#]
#print rps_tournament_winner(x)
#print "\n"
