import tkinter as tk
import random

# Function to determine the winner
def determine_winner(player_choice, computer_choice):
    if player_choice == computer_choice:
        return "Draw"
    elif (player_choice == "rock" and computer_choice == "scissors") or \
         (player_choice == "scissors" and computer_choice == "paper") or \
         (player_choice == "paper" and computer_choice == "rock"):
        return "Player wins"
    else:
        return "Computer wins"

# Function to handle button click and update the result
def play(player_choice):
    choices = ["rock", "paper", "scissors"]
    computer_choice = random.choice(choices)
    result = determine_winner(player_choice, computer_choice)
    result_label.config(text=f"Computer chose: {computer_choice}\nResult: {result}")

# Create the main window
root = tk.Tk()
root.title("Rock-Paper-Scissors")

# Create a label to display instructions
instruction_label = tk.Label(root, text="Choose Rock, Paper, or Scissors:", font=("Arial", 14))
instruction_label.pack(pady=10)

# Create and place the buttons
rock_button = tk.Button(root, text="Rock", command=lambda: play("rock"), width=10)
rock_button.pack(pady=5)

paper_button = tk.Button(root, text="Paper", command=lambda: play("paper"), width=10)
paper_button.pack(pady=5)

scissors_button = tk.Button(root, text="Scissors", command=lambda: play("scissors"), width=10)
scissors_button.pack(pady=5)

# Create and place the result label
result_label = tk.Label(root, text="", font=("Arial", 14))
result_label.pack(pady=10)

# Start the GUI event loop
root.mainloop()
