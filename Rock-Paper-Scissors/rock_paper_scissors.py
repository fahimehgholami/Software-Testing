import random

#Fahimeh Gholami 

def determine_winner(player_choice, computer_choice):
    if player_choice == computer_choice:
        return "Draw"
    elif (player_choice == "rock" and computer_choice == "scissors") or \
         (player_choice == "scissors" and computer_choice == "paper") or \
         (player_choice == "paper" and computer_choice == "rock"):
        return "Player wins"
    else:
        return "Computer wins"

def main():
    choices = ["rock", "paper", "scissors"]
    player_choice = input("Enter rock, paper, or scissors: ").lower()
    if player_choice not in choices:
        print("Invalid choice! Please choose rock, paper, or scissors.")
        return
    computer_choice = random.choice(choices)
    print(f"Computer chose: {computer_choice}")
    result = determine_winner(player_choice, computer_choice)
    print(result)

if __name__ == "__main__":
    main()
