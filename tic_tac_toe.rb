#1. print out grid
#2. let user choose a grid
#3. computer will choose a grid
#4. store choices in an array
#5. populate array value onto the grid
#6. check if player has won

require 'pry'

def print_grid(arr)

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
  win_conditions = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
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

puts "Lets play Tic Tac Toe!"
playing = true
arr = []
initialize_array(arr)

begin

  print_grid(arr)

  puts "Choose a position (from 1 to 9 ) to place a piece"
  user_position = gets.chomp

  if !(1..9).to_a.include?(user_position.to_i) #check if user has entered a valid input
    begin
      puts "Please choose a valid position, from 1 - 9:"
      user_position = gets.chomp
    end while ![1..9].include?(user_position.to_i)
  end

  if arr[user_position.to_i - 1] != " " #check if user input grid is already occupied
    begin
      puts "Grid already filled, please choose another position, from 1 - 9:"
      user_position = gets.chomp
    end while arr[user_position.to_i - 1] != " "
  end

  arr[user_position.to_i - 1] = "X" #user input will print X in grid

  print_grid(arr)

  computer_position = rand(1..9) #generate a random number

  if arr[computer_position - 1] != " " #if computer position is already occupied, keep generate until a valid input pops out
    begin
      computer_position = rand(1..9)
    end while arr[computer_position - 1] != " "
  end

  arr[computer_position.to_i - 1] = "O" #user input will print X in grid

  print_grid(arr)

  result = check_win(arr)

  if result != nil
    if result == 1
      puts "You win!"
      break
    elsif result == 2
      puts "Computer wins!"
      break
    end
  end

  break if playing == false || check_full(arr) == false
end while playing == true || check_full(arr)== true
