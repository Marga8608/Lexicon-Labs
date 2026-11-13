from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

books = [
    {"id": 1, "title": "Dune", "author": "Frank Herbert", "year": 1965},
    {"id": 2, "title": "Neuromancer", "author": "William Gibson", "year": 1984},
    {"id": 3, "title": "The Hobbit", "author": "J.R.R. Tolkien", "year": 1937},
    {"id": 4, "title": "Foundation", "author": "Isaac Asimov", "year": 1951},
]

class Book(BaseModel):
    title:str
    author: str
    year: int

def find_book(book_id: int):
    for book in books:
        if book["id"] == book_id:
            return book

app = FastAPI()
@app.get("/")
def home():
    return {"message" : "Hello World!"}

@app.get("/books")
def get_books(author: str | None = None):
    if author:
        return [book for book in books if author.lower() in book["author"].lower()]
    return books

@app.get("/books/{book_id}")
def get_book(book_id: int):
    find_book(book_id)

@app.post("/books", status_code=201)
def create_book(book: Book):
    new_id = max((b["id"] for b in books), default = 0) + 1
    new_book = {'id' : new_id, 'title': book.title, 'author': book.author, 'year': book.year}
    books.append(new_book)

"""
@app.put("/books/{book_id}")
def replace_book(book_id: int, book: Book):
    existing = find_book(book_id)
    existing
"""
