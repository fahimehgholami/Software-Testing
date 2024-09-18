import calculatorUtils  

operand = "start"

while operand != "exit":
    operand = input("Do you want to '+', '-', '*', or '/'? Type 'exit' to exit the program: ")

    if operand == "exit":
        print("Thank you for using this application")
        break

    number1Given = False
    number2Given = False

    while not number1Given:
        try:
            number1 = int(input("Give a Number 1: "))
            number1Given = True
        except ValueError:
            print("Please enter a valid number!")

    while not number2Given:
        try:
            number2 = int(input("Give a Number 2: "))
            number2Given = True
        except ValueError:
            print("Please enter a valid number!")

    # Perform the calculation based on the operand
    if operand == "+":
        print(f"Result: {calculatorUtils.addition(number1, number2)}")
    elif operand == "-":
        print(f"Result: {calculatorUtils.subtract(number1, number2)}")
    elif operand == "*":
        print(f"Result: {calculatorUtils.multiply(number1, number2)}")
    elif operand == "/":
        if number2 != 0:
            print(f"Result: {calculatorUtils.divide(number1, number2)}")
        else:
            print("Error: Division by zero is not allowed.")
    else:
        print("Invalid input, please choose a valid operation.")

print("Exiting the program.")
