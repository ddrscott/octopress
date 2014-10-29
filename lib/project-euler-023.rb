#!/usr/bin/env ruby
require 'prime'
require 'set'

class Integer
  def divisors
    n = self
    splat = n.prime_division.map do |prime,powers| 
      (0..powers).map{|exp| prime**exp}
    end
    if splat.size == 1
      splat.flatten
    else
      splat.inject(:product).map{|c| c.flatten.inject(:*)}
    end
  end

  def div_sum
    divisors.reduce(:+) - self
  end

  def abundant?
    div_sum > self
  end

  def ab_to_s
    if abundant? 
      "\e[32m#{self}\e[0m"
    else
      to_s  
    end
  end
end
MAX_TEST = 28123
def pretty_ab(n)
  format = if n.abundant?
    "\e[32m%6d\e[0m"
  else
    "%6d"
  end
  format % n
end

def graph
  (12..MAX_TEST).each{|c| print pretty_ab(c) }
end

@abundants = Set.new((12..MAX_TEST).select{|s|s.abundant?})






