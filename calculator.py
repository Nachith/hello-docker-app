def add(a,b):
    sum = a + b
    return sum

def subtract(a,b):
    diff = a - b
    return diff

def multiply(a,b):
    prod = a * b
    return prod

def divide(a,b):
    if b == 0:
        return
    div = a / b
    return div

print("Welcome to the Docker Calculator app")
num1 = float(input("Enter the first number:\n"))
num2 = float(input("Enter the second number:\n"))

operation = input("Enter the operation (+, -, *, /):\n")

if operation == '+':
    result = add(num1, num2)
elif operation == '-':
    result = subtract(num1, num2)
elif operation == '*':
    result = multiply(num1, num2)
elif operation == '/':
    result = divide(num1, num2)
else:
    print("Invalid operation")

print(f"The result is: {result}")       