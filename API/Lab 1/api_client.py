import requests

def get_json(url):
    response = requests.get(url)
    response.raise_for_status()
    print("You go girl!") 
    return response.json()