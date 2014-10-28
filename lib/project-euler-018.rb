#!/usr/bin/env ruby
require 'pry'

rows = DATA.readlines.collect{|line| line.split.collect(&:to_i)}

a,b,c = rows.shift,nil,nil
work = [[a, [a[0]]]] # [original,maximums]
while b = rows.shift
  # max of left or right sum
  c = b.each_with_index.map{|v,i| [left=(i-1 < 0 ? v : a[i-1]+v),right=(a[i].to_i+v)].max}
  work << [b, c]   # save work for later
  a = c            # reset previous row with winners
end
puts "Maximum Total: #{c.max}"

w = nil # winning indexk
work.reverse.each_with_index.map do |orig_max,i|
  original, max=*orig_max
  w = if w
    # find winner between the 2 nodes 
    left=(w < 0 ? 0 : max[w-1]) 
    right=max[w].to_i
    (left > right) ? w-1 : w
  else
    # find winner at end of tree
    max.index(max.max)
  end
  padding = '  ' * (work.size + i)
  line = original.collect{|o| (o == original[w] ? "\e[31m%02d\e[0m" : '%02d') % o}.join('  ')
  puts "#{padding}#{line}"
end

__END__
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
