# frozen_string_literal: true

# Sum square difference
#
# Problem 6
#
# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
#
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

number = 100

# This gets you the sum of the numbers
# 10 * (10 + 1) / 2
sum = (number * (number + 1) / 2) ** 2

# This calculates the sum of the square of each number
sqr = (number * (number + 1)) * (number * 2 + 1) / 6

puts sum - sqr

# Answer: 25_164_150

# My original answer using loops
#
# sqr = 0
# sum = 0
#
# (1..100).each do |number|
#   sqr += number ** 2
#   sum += number
# end
#
# sumsqr = sum ** 2
#
# puts sumsqr - sqr
