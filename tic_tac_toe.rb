#1. print out grid
#2. let user choose a grid
#3. computer will choose a grid
#4. store choices in an array
#5. populate array value onto the grid
#6. check if player has won

require 'pry'

def print_grid(arr)

system 'clear'
puts "#{arr[0]}|#{arr[1]}|#{arr[2]}"
puts "-----"
puts "#{arr[3]}|#{arr[4]}|#{arr[5]}"
puts "-----"
puts "#{arr[6]}|#{arr[7]}|#{arr[8]}"
puts "-----"
puts "     "

end

def initialize_array(arr)
  9.times do
    arr.push(" ")
  end
end

def check_win(arr)
  win_conditions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [3,5,8], [0,4,8], [2,4,6]]
  win_conditions.each do |condition|
    return 1 if arr.values_at(*condition).count('X') == 3
    return 2 if arr.values_at(*condition).count('O') == 3
  end
  nil
end

def check_full(arr)
  if !arr.include?(" ")
    return false
  end
end

def check_filled(board, position)
  if board[position.to_i - 1] != " "
    true
  else
    false
  end
end

puts "Lets play Tic Tac Toe!"
playing = true
board = []
initialize_array(board)
print_grid(board)

begin

  begin
    puts "Please choose a position, from 1 - 9:"
    user_position = gets.chomp
  end while !(1..9).to_a.include?(user_position.to_i)

  if check_filled(board, user_position) == true #check if user input grid is already occupied
    begin
      puts "Grid already filled, please choose another position, from 1 - 9:"
      user_position = gets.chomp
    end while check_filled(board, user_position) == true
  end

  board[user_position.to_i - 1] = "X" #user input will print X in grid
  print_grid(board)

  begin #if computer position is already occupied, keep generate until a valid input pops out
    computer_position = rand(1..9)
  end while check_filled(board, computer_position) == true

  board[computer_position.to_i - 1] = "O" #computer input will print O in grid
  print_grid(board)
  result = check_win(board)

  if result != nil
    if result == 1
      puts "You win!"
      break
    elsif result == 2
      puts "Computer wins!"
      break
    end
  end

  break if playing == false || check_full(board) == false
end while playing == true || check_full(board)== true
