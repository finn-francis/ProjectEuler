# frozen_string_literal: true

# Largest palindrome product
# Problem 4
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

# 1. Method to detect if a number is a palindrome
# 2. Find the largest product of 2 3 digit numbers: 998,001
# 3. Find the largest palindrom smaller than the result of step 2
# 4. Starting with the second largest 3 digit number (998), divide the palindrome by each
#    until the result is an integer
# 5. If there are no 3 digit numbers making the palindrome, go to step 3 and find the next
#    smalles palindrom. Loop over these steps until it's found.

def is_palindrome?(number)
  number.to_s.reverse == number.to_s
end

def find_largest_palindrome(low_range, high_range)
  (low_range..high_range).reverse_each.find { |number| is_palindrome?(number) }
end


digits = 3

# Calculate the largest x digit number
largest_number = (1..digits).map { |_digit| 9 }.join('').to_i

# Generates the smallest x digit number
small_number_array = Array.new(digits - 1, 0).unshift(1)
smallest_number = small_number_array.join('').to_i

# Find the largest product of x digit number
largest_product = largest_number ** 2

# Starting step 3
# We will loop back to here if step 5 fails
largest_palindrome = find_largest_palindrome(smallest_number, largest_product)

# loop here
current_palindrome = largest_palindrome

numbers = []

loop do
  result = (smallest_number..largest_number).reverse_each do |number|
    division = current_palindrome.to_f / number.to_f

    # Check that the division is smaller than the largest 3 digit number
    # and that the result is an integer
    if division < largest_number && division.floor == division
      numbers = [number, division.to_i]
      break
    end
  end

  break unless result.is_a?(Range)

  # Try again with the next smallest palindrome
  current_palindrome = find_largest_palindrome(smallest_number, current_palindrome - 1)
end

puts current_palindrome

# Answer: 906609 = 993 * 913
