# Python program to find the SHA-1 message digest of a file

# importing the hashlib module
import hashlib

def hash_file(filename):
   """"This function returns the SHA-1 hash
   of the file passed into it"""

   # make a hash object
   h = hashlib.sha1()

   # open file for reading in binary mode
   with open(filename,'rb') as file:
        h.update(file.read())

   # return the hex representation of digest
   return h.hexdigest()

message = hash_file("track1.mp3")
print(message)