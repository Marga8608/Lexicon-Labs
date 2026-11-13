from api_client import get_json
import requests
BASE = "http://127.0.0.1:8000"

books = get_json(f"{BASE}/books")
print(books)