#Part G
#1
numbers = [3,15,2,45,6,9,23]
def min_max(num):
    smallest = num[0]
    largest = 0
    for n in num:
        if n < smallest:
            smallest = n
        if n > largest:
            largest = n
    return(smallest, largest)
print(min_max(numbers))

#2
words = ["mango", "kayak", "lemon", "racecar"]
def palindrome(word):
    for i in range(len(word)//2):
        if word[i] != word[-(i+1)]:
            return False
            break
    return True
for word in words:
    if palindrome(word):
        print(word + " is a palindrome!")