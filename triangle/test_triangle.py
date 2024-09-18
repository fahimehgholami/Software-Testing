
import unittest
from triangle import classify_triangle  

#Fahimeh Gholami 

class TestTriangleClassification(unittest.TestCase):
    # Test case for an equilateral triangle
    def test_equilateral_triangle(self):
        # Arrange
        a = 5
        b = 5
        c = 5

        # Act
        result = classify_triangle(a, b, c)

        # Assert
        self.assertEqual(result, "Equilateral")

    # Test case for an isosceles triangle
    def test_isosceles_triangle(self):
        # Arrange
        a = 5
        b = 5
        c = 3

        # Act
        result = classify_triangle(a, b, c)

        # Assert
        self.assertEqual(result, "Isosceles")

    # Test case for a scalene triangle
    def test_scalene_triangle(self):
        # Arrange
        a = 4
        b = 5
        c = 6

        # Act
        result = classify_triangle(a, b, c)

        # Assert
        self.assertEqual(result, "Scalene")

    # Test case for invalid input (sides not forming a triangle)
    def test_invalid_triangle(self):
        # Arrange
        a = 1
        b = 2
        c = 10

        # Act
        result = classify_triangle(a, b, c)

        # Assert
        self.assertEqual(result, "Invalid: The given sides do not form a valid triangle.")

    # Test case for non-positive side lengths
    def test_non_positive_sides(self):
        # Arrange
        a = -1
        b = 5
        c = 6

        # Act
        result = classify_triangle(a, b, c)

        # Assert
        self.assertEqual(result, "Invalid input: Side lengths must be positive numbers.")

if __name__ == "__main__":
    unittest.main()
