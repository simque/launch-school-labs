VALID_CHOICES = %w(rock paper scissors lizard spock) # extracted due to repetetive code

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper") ||
    (first == "lizard" && second == "spock") ||
    (first == "rock" && second == "lizard") ||
    (first == "spock" && second == "scissors") ||
    (first == "scissors" && second == "lizard") ||
    (first == "lizard" && second == "paper") ||
    (first == "paper" && second == "spock") ||
    (first == "spock" && second == "rock")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do # super loop

  player_wins = 0
  computer_wins = 0
  
  loop do # main loop
    choice = ""
    loop do # mini loop
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
    else
      (computer_wins += 1) && (player_wins += 1)
    end

    break if player_wins == 5 || computer_wins == 5
  end # main loop

  prompt("Would you like to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?("y")
end # super loop

prompt("Thank you for playing. Good bye!")
