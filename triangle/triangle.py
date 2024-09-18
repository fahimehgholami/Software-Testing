
def classify_triangle(a, b, c):
    if a <= 0 or b <= 0 or c <= 0:
        return "Invalid input: Side lengths must be positive numbers."
    
    if a + b <= c or a + c <= b or b + c <= a:
        return "Invalid: The given sides do not form a valid triangle."

    # quilateral 
    if a == b == c:
        return "Equilateral"
    # isosceles 
    elif a == b or a == c or b == c:
        return "Isosceles"
    # scalene 
    else:
        return "Scalene"

#Fahimeh Gholami 
