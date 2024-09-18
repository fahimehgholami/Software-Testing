import unittest
import calculatorUtils

class MyCalculatorTest(unittest.TestCase):
    def test_calculateSumOfIntegers_A_and_B_AssignValueToInteger_C(self):
        #Arrange
        a = int(4)
        b = int(5)
        #Act
        result = calculatorUtils.addition(a, b)
        #Assert
        self.assertEqual(result,9)

    def test_calculateReminderOfIntegers_A_and_B_AssignValueToInteger_C(self):
        #Arrange
        a = int(10)
        b = int(3)
        #Act
        result = calculatorUtils.subtract(a, b)
        #Assert
        self.assertEqual(result,7)
        
    def test_calculateProductOfIntegers_A_and_B_AssignValueToInteger_C(self):
        #Arrange
        a = int(6)
        b = int(6)
        #Act
        result = calculatorUtils.multiply(a, b)
        #Assert
        self.assertEqual(result,36)
        
    def test_calculateQuitinentOfIntegers_A_and_B_AssignValueToInteger_C(self):
        #Arrange
        a = int(10)
        b = int(5)
        #Act
        result = calculatorUtils.divide(a, b)
        #Assert
        self.assertEqual(result,2)
        
if __name__ == "__main__":
    unittest.main()