# frozen_string_literal: true

# Special Pythagorean triplet
# Problem 9
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
#
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

target = 1000

a = 0
b = 0
c = 0

found = false

(1..(target / 3)).each do |i|
  a = i + 1

  # Loop from 1 to 500 (half target, and see if condition)
  (target / 2).times do |j|
    b = j + 1
    c = target - a - b

    if (a**2 + b**2 == c**2)
      found = true
      break
    end
  end
  break if found
end

puts a * b * c
