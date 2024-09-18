
def check_age(age):
    if not isinstance(age, int):
        raise TypeError("Age must be an integer.")
    
    if age < 18:
        return "You are a child"
    elif age < 70:
        return "You are an adult"
    else:
        return "You are a pensioner"

# Example Usage
if __name__ == "__main__":
    try:
        age = int(input("Enter your age: "))
        print(check_age(age))
    except ValueError:
        print("Invalid input. Please enter a valid number.")
