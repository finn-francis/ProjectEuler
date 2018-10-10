# frozen_string_literal: true
#
# Largest prime factor
# Problem 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

require 'prime'

target = 600_851_475_143
# We only need to check up to the square root,
# as every number greater than this will be covered
sqrt = Math.sqrt(target).ceil

answer = Prime.each(sqrt).max do |number|
  (target % number == 0) ? number : 0
end

# Answer: 6857
