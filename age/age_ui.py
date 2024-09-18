
from age_verification import check_age 

def main():
    print("Welcome to the Age Verification Program!")

    while True:
        try:
            age_input = input("Please enter your age (or type 'exit' to quit): ")

            # Exit condition
            if age_input.lower() == 'exit':
                print("Thank you for using the Age Verification Program!")
                break

            # Convert input to integer
            age = int(age_input)

            # Call the check_age function and display the result
            result = check_age(age)
            print(result)

        except ValueError:
            print("Invalid input. Please enter a valid integer for your age.")

if __name__ == "__main__":
    main()
