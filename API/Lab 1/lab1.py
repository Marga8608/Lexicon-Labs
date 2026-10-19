import requests
from api_client import get_json

#Exercise 1

products = get_json("https://fakestoreapi.com/products")

sorted_products = sorted(products, key=lambda p: p['price'])

for product in sorted_products:
    print(f"{product['title']} - {product['price']} SEK")

#Exercise 2

categories = get_json("https://fakestoreapi.com/products/categories")
print(categories)
category = input("Choose a category: ")
products2 = get_json(f"https://fakestoreapi.com/products/category/{category}")
sorted_products2 = sorted(products2, key=lambda p: p['price'])

print(f"Products in {category}: {len(products2)}")
print(f"Cheapest product: {sorted_products2[0]['title']}")
