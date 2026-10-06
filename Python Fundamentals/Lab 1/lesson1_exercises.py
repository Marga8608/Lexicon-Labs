#Part A
#1
print("Anastasia")
print("Python & AI")
print("Python fundamentals")
#2
name="Ana"
age=40
height=1.75
is_student=True
print(name)
print(age)
print(height)
print(is_student)
print(type(name))
print(type(age))
print(type(height))
print(type(is_student))
#3
print(age)
age=age+1
print(age)
#4
x=10
y=3
print("The sum of x and y is:", str(x+y))
print("The difference of x and y is:", str(x-y))
print("The product of x and y is:", str(x*y))
print("The quotient of x by y is:", str(x/y))
print("The result of floor division of x and y is:", str(x//y))
print("The remainder of x divided by y is:", str(x%y))
print("X to the power of y is:", str(x**y))
#5
#string to int
#calculation that uses user input
#int to float
#calculation that requires floats
#number to string
#string concatenation that uses a result of a calculation

#Part B
#1
"""
name = input("Enter your name: ")
birth_year = int(input("Enter your birth year: "))
current_year = 2026
print("The approximate age of", name, "is:", current_year - birth_year)
#2
price = float(input("Enter the price of the item: "))
discount = input("Enter the discount percentage (e.g., 20 for 20%): ")             
final_price = round(price * (1 - float(discount) / 100), 2)
print("The final price of the item is:", final_price)
#3
temperature_celsius = float(input("Enter the temperature in Celsius: "))
temperature_fahrenheit = (temperature_celsius * 9/5) + 32
#4 
length = float(input("Enter the length of the room: "))
width = float(input("Enter the width of the room: "))
area = length * width
perimeter = 2 * (length + width)
#5
#User input needs to be converted to int in order to do calculations with it
#If the input isn't numeric, the program will raise a ValueError when trying to convert it to int
"""
#Part C
#1
classic = " Hello, World! "
print(classic.upper())
print(classic.lower())
print(classic.strip())
#2 
"""
first_name = input("Enter your first name: ")
last_name = input("Enter your last name: ")
full_name = f"{first_name} {last_name}"
print("Your full name is:", full_name)
"""
#3 
string_1 = "python programming"
print(string_1[0])
print(string_1[-1])
print(string_1[0:6])
print(string_1[-11:])
print(string_1[::-1])
#4
"""
first_name = input("Enter your first name: ")
last_name = input("Enter your last name: ")
first = ""
second = ""
if len(first_name) >=3:
    first = first_name[:3]
else:
    first = first_name
if len(last_name) >=5:
    second = last_name[:5]
else:
    second = last_name
user_name = f"{first.lower()}{second.lower()}"
print("Your generated username is:", user_name)
"""
#5
"""
email = input("Enter your email address: ")
tag = email.split("@")
print("The username part of your email is:", tag[0])
print("The domain part of your email is:", tag[1])
"""
#6
first = "Java is the best programming language!"
second = "Python" + first[4:]
print(first)
print(second)

#Part D
#1
print(second[:6]) #Python
print(second[-9:])  #language!
print(second[2])   #t
print(second[-1])  #!
print(second[0:6]) #Python
print(second[-9:-2])  #languag
print(second[::-1])  #!egaugnal gnimmargorp tseb eht si nohtyP
print(second[::2])   #Pto stebs rgamn agae
#2
random = "Artificial Intelligece"
print(random[2])   #Prints the third character of the string
print(random[-1])  #Prints the last character
print(random[0:6]) #Prints the first six characters
print(random[-9:-2])  #Counting from the end, prints the ninth to third characters (inclusively)
print(random[::-1])  #Prints the string in reverse order
print(random[::2])   #Prints every second character of the string
#3
# .split() method is a string method that splits a string into a list of substrings based on a specified character and converts it to a list including the substrings.
# .strip() method strips the white spaces at the beginning and the end
# .replace(existing, new, occurences) returns a copy of the string
# with existing substrings replaced by new substrings.
# the number of existing substrings to be replaced is specified with occurences.
# in operator specifies where to look, for example in range(:100) will look at a range of 
# numbers from 0 to 99.
#4
my_string = "Python is a powerful programming language."
#my_string[3] = "z"
#the above line gives a TypeError, because strings can not be changed once created.
new_string = my_string.replace("h", "z", 1)
print(new_string)

#Part E
"""
first_name = input("Enter your first name: ").strip()
last_name = input("Enter your last name: ").strip()
city = input("Enter your city: ").strip()
year_of_birth = input("Enter your year of birth: ").strip()
favourite_language = input("Enter your favourite programming language: ").strip()
user_id = f"{first_name.lower()[:3]}{last_name.lower()[:5]}{year_of_birth[-2:]}"
print(f"Your full name is: {first_name} {last_name}")
print(f"You were born in: {year_of_birth}") 
print(f"You live in: {city}")
print(f"Your favourite programming language is: {favourite_language}")
print(f"Your generated user ID is: {user_id}")
print(f"Your initials are: {first_name[0].upper()}{last_name[0].upper()}")
print(f"The length of your full name is: {len(first_name) + len(last_name)} characters")
print(f"Your favourite programming language in reverse order is: {favourite_language[::-1]}")
print(f"The first three characters of your city are: {city[:3]}")
print(f"You were {2000 - int(year_of_birth)} years old at the beginning of the year 2000.")
print(f"Congratulations {first_name}! You have completed the exercise.")
"""
#Part F
#1
"""
seconds = int(input("Enter the number of seconds: "))
hours = seconds // 3600
remaining_minutes = (seconds % 3600) // 60
remaining_seconds = seconds % 60
print(f"{seconds} seconds is equal to {hours} hours, {remaining_minutes} minutes, and {remaining_seconds} seconds.")
"""
#2
"""
my_int = int(input("Enter a four-digit integer: "))
digit_1 = my_int // 1000
digit_2 = (my_int % 1000) // 100
digit_3 = (my_int % 100) // 10 
digit_4 = my_int % 10
print(f"The digits of the integer {my_int} are: {digit_1}, {digit_2}, {digit_3}, {digit_4}")
"""
#3
"""
my_word = input("Enter a word: ")
if len(my_word) < 4:
    print("The word is too short. Please enter a word with at least 4 characters.")
else:
    new_word = my_word[0:2]
    for i in range(2, len(my_word) - 2):
        new_word += "*"
    new_word += my_word[-2:]
    print(f"The new word is: {new_word}")
    """
#4
x = "3.14"
y = float(x)
print(y**2)

new_string = "Thank goodness I'm nearly done!"
print(new_string[:-1])

print(new_string.split())

print(new_string.replace("nearly", "finally", 2))

print("nearly" in new_string)
