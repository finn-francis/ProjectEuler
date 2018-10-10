# frozen_string_literal: true

# Smallest multiple
# Problem 5
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require 'prime'

# Using recursion, we create a factor tree
# We find the lowest prime number that we can divide the number by
# take the division, and repeat until we have a list of prime factors
def prime_factors(primes, number = nil)
  if primes.include?(number)
    [number]
  else
    prime = nil
    division = nil

    primes.each do |num|
      division = number.to_f / num
      if division == division.floor
        division = division.to_i
        prime = num
        break
      end
    end

    [prime, *prime_factors(primes, division)]
  end
end


range = (2..20)

# Returns a list of prime factors
primes = range.each.map do |number|
  inner_primes = Prime.each(number).to_a
  prime_factors(inner_primes, number)
end

# This loop finds the highest occurrence of each prime number
# in each different set of prime factors
#
# We'll call the highest occurrence: h
#
# We then take each prime h tims and multiply them together
#
# e.g.
#
# 30 = 2 × 3 × 5
# 45 = 3 × 3 × 5
#
# 2: one occurrence
# 3: two occurrences
# 5: one occurrence
# 2 × 3 × 3 × 5 = 90 <— LCM

lcm = primes.each_with_object({}) do |array, hash|
  array.each do |prime|
    prime_count = array.count { |number| number == prime }
    next if hash[prime] && hash[prime].size >= prime_count
    hash[prime] = Array.new(prime_count, prime)
  end
end.values.flatten.inject(&:*)

puts lcm

# The easy way

require 'rational'
num = (1..20).inject(1) { |result, n| result.lcm n }

puts num

# Another really cool way
# We take the last lcm, and keep adding it to itself until it's divisible by our current number
#
# e.g.
# LCM of 1 = 1
#
# 2 isn't a factor of 1, so we add one to our previous answer (1) and get 2
# which is divisible by 2
#
# 3 isn't a factor of 2 so we add 2, getting 4
# 3 isn't a factor of 4 so we add another 2 and get 6, which is divides by 3
#
# Carry on like this
def snd(max)
  result = 1
  (1..max).each do |number|
    prev = result
    while result % number > 0
      result += prev
    end
  end
  return result
end

puts snd(20)

