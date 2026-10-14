import sqlite3

conn = sqlite3.connect("webshop.db")
cursor = conn.cursor()

#Exercise 1
'''
cursor.execute("SELECT first_name, last_name, city from customers")
for first_name, last_name, city in cursor.fetchall():
    print(f"{first_name} {last_name} - {city}")
conn.close()  
'''

#Exercise 2
'''
user_input = input("Enter max price: ")
cursor.execute("SELECT name, price FROM products WHERE price <= ?", (user_input,))
for name, price in cursor.fetchall():
    print(f"{name:<20} {price:>8.2f} kr")
conn.close()
'''
#Fetching products one row at a time, to avoid crashing:
row = cursor.fetchone()
while row is not None:
    name, price = row
    print(f"{name:<20} {price:>8.2f} kr")
    row = cursor.fetchone() # Fetch the next row for the next iteration

#Most efficient way to iterate over the cursor object:
for name, price in cursor:
    print(f"{name:<20} {price:>8.2f} kr")

#Exercise 3
'''
user_input = input("Enter a category: ")
cursor.execute("SELECT COUNT(*) FROM products WHERE category = ?", (user_input,))
count = cursor.fetchone()[0]
print("Products:", count)
conn.close()
'''

#Exercise 4
#Placeholders make sure the database interprets the imput correctly, as a value to seach for,
#and not as a code to execute. This is to prevent unauthorized access to the database.