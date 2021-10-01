require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
player_wins = 0
computer_wins = 0

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, indentation=', ', word='or')
  last_num = arr.pop
  arr.push(word)
  if arr.count == 2
    arr.join(" ") + " #{last_num}"
  elsif arr.count == 1
    arr.pop
    arr.push(last_num).join()
  else
    arr.join(indentation) + " #{last_num}"
  end
end

def player_places_piece!(brd)
  square = ""
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end
  
  if brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  elsif !square
    square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

loop do
  board = initialize_board
  choice = ""
  loop do
    prompt("Who would you like to go first? (C or P)")
    choice = gets.chomp.upcase
    break if choice == 'C' || choice == 'P'
    prompt("Please select either C or P.")
  end
  
if choice == "P"
  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
elsif choice == "C"
  loop do
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
end

  display_board(board)

  if someone_won?(board)
    player_wins += 1 if detect_winner(board) == "Player"
    computer_wins += 1 if detect_winner(board) == "Computer"
    prompt("#{detect_winner(board)} won! Score is Player: #{player_wins} Computer: #{computer_wins}")
  else
    prompt("It's a tie. Score is Player: #{player_wins} Computer: #{computer_wins}")
  end

  if player_wins == 5
    prompt("Player reached 5 first!")
    break
  elsif computer_wins == 5
    prompt("Computer reached 5 first!")
    break
  end
end

prompt("Thanks for playing Tic Tac Toe! Good bye!")
