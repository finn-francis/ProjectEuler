# frozen_string_literal: true

# Power digit sum
# Problem 16
#
# 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 21000?

puts (2 ** 1000).to_s.each_char.sum { |char| char.to_i }

# Answer: 1366
