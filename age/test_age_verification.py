import unittest
from age_verification import check_age

class TestAgeVerification(unittest.TestCase):

    def test_under_18(self):
        # Age is under 18
        self.assertEqual(check_age(10), "You are a child")
        self.assertEqual(check_age(17), "You are a child")

    def test_under_70(self):
        # Age is between 18 and 69
        self.assertEqual(check_age(18), "You are an adult")
        self.assertEqual(check_age(50), "You are an adult")
        self.assertEqual(check_age(69), "You are an adult")

    def test_over_70(self):
        # Age is 70 and above
        self.assertEqual(check_age(70), "You are a pensioner")
        self.assertEqual(check_age(100), "You are a pensioner")

    def test_invalid_input(self):
        # Additional tests for invalid inputs
        with self.assertRaises(TypeError):
            check_age("twenty")

        with self.assertRaises(TypeError):
            check_age(None)

        with self.assertRaises(TypeError):
            check_age([])

if __name__ == "__main__":
    unittest.main()
