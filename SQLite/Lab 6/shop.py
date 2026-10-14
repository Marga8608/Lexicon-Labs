import sqlite3
 
 
def connect():
    conn = sqlite3.connect("webshop.db")
    conn.execute("PRAGMA foreign_keys = ON")
    return conn
 
 
def list_products(conn):
    cursor = conn.execute("SELECT product_id, name, price, stock FROM products")
    for pid, name, price, stock in cursor.fetchall():
        print(f"{pid:>3}  {name:<20} {price:>8.2f} kr  ({stock} in stock)")
 
 
def search_customers(conn):
    city = input("City: ")
    cursor = conn.execute(
        "SELECT first_name, last_name FROM customers WHERE city = ?", (city,))
    rows = cursor.fetchall()
    if not rows:
        print("No customers found.")
    for first, last in rows:
        print(first, last)
 
 
def add_product(conn):
    name = input("Name: ")
    category = input("Category: ")
    while True:
        try:
            price_input = input("Enter the price: ")
            price = float(price_input)
            break 
        except ValueError:
            print("Error: Price must be a number. Please try again.")
    stock = int(input("Stock: "))
    conn.execute(
        "INSERT INTO products (name, category, price, stock) VALUES (?, ?, ?, ?)",
        (name, category, price, stock))
    conn.commit()
    print("Saved!")
#Exercise 5
def change_stock(conn):
    name = int(input("Product name: "))
    new_stock = int(input("New stock: "))
    conn.execute(
        "UPDATE products SET stock = ? WHERE product_id = ?",
        (new_stock, name))
    conn.commit()
    print("Stock updated!")
 #Exercise 6
def show_receipt(conn):
    ord_id = int(input("Order ID: "))
    cursor = conn.execute(
        '''SELECT o_i.order_id, p.name, o_i.quantity, o_i.unit_price*o_i.quantity AS 'Total'
        FROM order_items o_i
        JOIN products p ON p.product_id = o_i.product_id
        WHERE o_i.order_id = ?''', (ord_id,))
    if cursor is not None: 
        for order_id, product, quantity, total in cursor:
            print(f"Order number {order_id}: {product} x {quantity}, {total}kr.")

def top_three(conn):
    cursor = conn.execute(
        '''
        SELECT o_i.product_id, COUNT (*) as total_count, p.name
        FROM order_items o_i
        JOIN products p ON p.product_id = o_i.product_id
        GROUP BY o_i.product_id
        ORDER BY total_count DESC
        LIMIT 3
        '''
    )
    if cursor is not None: 
        for prod_id, count, name  in cursor:
            print(f"{name}: purchased {count} times.")

def main():
    conn = connect()
    while True:
        print("\n1) List products  2) Search customers  3) Add product 4) Change stock 5) Show receipt 6) Top products 0) Quit")
        choice = input("> ")
        if choice == "1":
            list_products(conn)
        elif choice == "2":
            search_customers(conn)
        elif choice == "3":
            add_product(conn)
        elif choice == "4":
            change_stock(conn)
        elif choice == "5":
            show_receipt(conn)
        elif choice == "6":
            top_three(conn)
        elif choice == "0":
            break
    conn.close()
 
 
main()
