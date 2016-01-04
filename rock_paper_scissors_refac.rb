VALID_CHOICES = %w(rock paper scissors lizard spock)

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

def keep_score(hash, player, computer)
   if win?(player, computer)
      hash[:player] += 1
    elsif win?(computer, player)
      hash[:computer] += 1
    else
      (hash[:player] += 1) && (hash[:computer] += 1)
    end
  end

loop do # super loop

  score_keeper = {player: 0, computer: 0}
  
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
    keep_score(score_keeper, choice, computer_choice)
   

    break if score_keeper[:player] == 5 || score_keeper[:computer] == 5
  end # main loop

  prompt("Would you like to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?("y")
end # super loop

prompt("Thank you for playing. Good bye!")
