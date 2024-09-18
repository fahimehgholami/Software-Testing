import unittest
from rock_paper_scissors import determine_winner

#Fahimeh Gholami 

class TestRockPaperScissors(unittest.TestCase):

    def test_rock_vs_rock(self):
        # Arrange
        player_choice = "rock"
        computer_choice = "rock"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Draw")

    def test_rock_vs_paper(self):
        # Arrange
        player_choice = "rock"
        computer_choice = "paper"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Computer wins")

    def test_rock_vs_scissors(self):
        # Arrange
        player_choice = "rock"
        computer_choice = "scissors"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Player wins")

    def test_paper_vs_rock(self):
        # Arrange
        player_choice = "paper"
        computer_choice = "rock"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Player wins")

    def test_paper_vs_paper(self):
        # Arrange
        player_choice = "paper"
        computer_choice = "paper"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Draw")

    def test_paper_vs_scissors(self):
        # Arrange
        player_choice = "paper"
        computer_choice = "scissors"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Computer wins")

    def test_scissors_vs_rock(self):
        # Arrange
        player_choice = "scissors"
        computer_choice = "rock"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Computer wins")

    def test_scissors_vs_paper(self):
        # Arrange
        player_choice = "scissors"
        computer_choice = "paper"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Player wins")

    def test_scissors_vs_scissors(self):
        # Arrange
        player_choice = "scissors"
        computer_choice = "scissors"
        # Act
        result = determine_winner(player_choice, computer_choice)
        # Assert
        self.assertEqual(result, "Draw")

if __name__ == "__main__":
    unittest.main()
