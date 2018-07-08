fib_series_twelve = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
puts "___________________________________________"
puts "\nFibonacci sequence to 12 (correct answer, as a check):"
p fib_series_twelve

# retuns array of the first n members of the fibonacci sequence (starting at 0),
# using iteration. "n" must be a non-negative integer
def fibs(n)
  result = []
  penultimate = 0
  last = 1
  ## skips iteration if n = 0
  1.upto(n) do |num|
    if num == 1
      result << penultimate
    elsif num == 2
      result << last
    else
      next_num = penultimate + last
      penultimate = last
      last = next_num
      result << next_num
    end
  end
  return result
end

# Provides simpler display mechanism for fibs(n) method
def display_fibs(n)
  puts "\nfibs(#{n}):"
  p fibs(n)
end

# test cases for fibs(n)
puts "\n___________________________________________"
puts "fibs(n) - iterative method:"
display_fibs(0)
display_fibs(1)
display_fibs(2)
display_fibs(3)
display_fibs(4)
display_fibs(5)
display_fibs(12)


# retuns array of the first n members of the fibonacci sequence (starting at 0),
# using recursion. "n" must be a non-negative integer.
def fibs_rec(n)
  case n
  when  0
    return []
  when 1
    return [0]
  when 2
    return [0,1]
  else
    array = fibs_rec(n-1)
    # offset to n-3 and n-2 to acccount for 0 position start
    array.push(array[n-3] + array[n-2])
    return array
  end
end

# Provides simpler display mechanism for fibs_rec(n) method
def display_fibs_rec(n)
  puts "\nfibs_rec(#{n}):"
  p fibs_rec(n)
end

# test cases for fibs_rec(n)
puts "\n___________________________________________"
puts "fibs_rec(n) - recursive method:"
display_fibs_rec(0)
display_fibs_rec(1)
display_fibs_rec(2)
display_fibs_rec(3)
display_fibs_rec(4)
display_fibs_rec(5)
display_fibs_rec(12)
