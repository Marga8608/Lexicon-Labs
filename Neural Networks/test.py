import pickle
import numpy

print(numpy.__version__)
# Open the file in read-binary mode ('rb')
with open('mnist.pkl', 'rb') as file:
    data = pickle.load(file, encoding="latin1")
print(type(data))
print("Length:", len(data))