import pprint
#Part F
names = [" wireless Headphones", "SMARTWATCH ", " Mechanical Keyboard", "gaming mouse",
          "Bluetooth SPEAKER", " USB-C Cable ", "Fitness Tracker", "4k monitor", 
          " Portable Charger", "Wireless Charger ", "Noise Canceling headphones",
            " Gaming Chair "]
categories = ["ELECTRONICS", " Wearables ", "accessories", " ACCESSORIES", "Electronics", 
              " accessories", "WEARABLES", "Electronics ", " Accessories", "electronics ",
                "Electronics", " Furniture "]
prices = [99.99, 199.50, 85.00, 49.99, 35.25, 12.99, 59.95, 299.99, 24.50, 19.99, 149.00, 210.00]
stocks = [45, 12, 0, 88, 30, 150, 22, 8, 75, 100, 15, 5]

def create(a,b,c,d):
    dict = []
    for i in range(0,len(d)):
        temp = {
            "Name": a[i],
            "Category": b[i],
            "Price": c[i],
            "Stock": d[i]
        }
        dict.append(temp)
    return(dict)
products = create(names,categories,prices,stocks)
#pprint.pprint(products, indent=4, width=60)
products_clean = [
    {
       "Name" : x["Name"].strip().upper(),
       "Category" : x["Category"].strip().upper(), 
       "Price" : x["Price"],
       "Stock" : x["Stock"]
    }
    for x in products
]
#pprint.pprint(products_clean, indent=4, width=60)
in_stock = [x["Name"] for x in products_clean if x["Stock"]>0]
#pprint.pprint(in_stock, indent=4, width=60)
cats = {x["Category"] for x in products_clean}
#pprint.pprint(cats, indent=4, width=60)
inventory_value = {x["Name"] : x["Price"]*x["Stock"] for x in products_clean}
pprint.pprint(inventory_value, indent=4, width=60, sort_dicts=False)
products_sorted = {
    k: v
    for k, v in sorted(
        inventory_value.items(), key=lambda item: item[1], reverse=True
    )
}
pprint.pprint(products_sorted, indent=4, width=60, sort_dicts=False)
for i, (product, value) in enumerate(products_sorted.items(), start=1):
    print(f"{i}. {product.strip().title()} - {value}")
