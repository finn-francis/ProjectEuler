# frozen_string_literal: true

# Longest Collatz sequence
# Problem 14
#
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
require 'benchmark'

puts Benchmark.measure {
already_seen = {}

largest_array = []
number_with_largest_array = 0
largest_array_length = 0

# The larger number yield larger chains, therefore it makes sense to go downwards,
# as this means we can add more numbers to the already_seen hash, speeding up the process
i = 999_999.downto(1).each do |number|
  result = []

  # We only check if the number has already been seen on the first iteration
  # This assures we don't have to do unnecessary calculations
  first_iteration = true
  current_element = number

  until current_element == 1 || (first_iteration && already_seen[number])
    already_seen[current_element] = true

    result << current_element

    if current_element.even?
      current_element /= 2
    else
      current_element = (current_element * 3) + 1
    end
    first_iteration = false
  end

  result_length = result.length

  # We check if the resulting array is longer than the current largest
  # All lengths are stored as variables to reduce calculation times
  if largest_array_length < result_length
    # largest_array = result << 1
    number_with_largest_array = number
    largest_array_length = result_length
  end
end
}

puts number_with_largest_array

# Answer: 837799
