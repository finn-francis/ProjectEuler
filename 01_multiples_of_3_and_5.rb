# frozen_string_literal: true

# Multiples of 3 and 5
#
# Problem 1
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

(0...1000).inject(0) do |object, num|
  object += ((num % 3).zero? || (num % 5).zero?) ? num : 0
end

# Answer: 233168
