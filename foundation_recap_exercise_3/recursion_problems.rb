#######################
# Recursion Problems
#######################

## multiply
# Write a method multiply(a, b) that takes in two numbers and 
# returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator

def multiply(a, b)
    return 0 if b == 0

     a + multiply(a, b - 1)
end