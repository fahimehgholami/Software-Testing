
from triangle import classify_triangle
def main():
    print("Welcome to the Triangle Classification Program!")

    while True:
        side1_input = input("Enter the length of side 1 (or type 'exit' to quit): ").strip()

        if side1_input.lower() == 'exit':
            print("Thank you for using the Triangle Classification Program!")
            break

        side2_input = input("Enter the length of side 2 (or type 'exit' to quit): ").strip()
        if side2_input.lower() == 'exit':
            print("Thank you for using the Triangle Classification Program!")
            break

        side3_input = input("Enter the length of side 3 (or type 'exit' to quit): ").strip()
        if side3_input.lower() == 'exit':
            print("Thank you for using the Triangle Classification Program!")
            break

        try:
            side1 = float(side1_input)
            side2 = float(side2_input)
            side3 = float(side3_input)

            result = classify_triangle(side1, side2, side3)
            print(f"Triangle Classification: {result}")

        except ValueError:
            print("Invalid input. Please enter valid numbers for all sides.")

if __name__ == "__main__":
    main()
