
# Recursive merge sort to sort arrays containing strings or number data types (floats, integer)
def merge_sort(array)
  n = array.length
  if n < 1
    # only occurs if initially calling merge_sort() on empty array []
    return []
  elsif n < 2
    return array
  else
    # case with 2 or more elements
    mid = (n / 2) - 1
    array_a = merge_sort(array[0..mid])        # sort first half
    array_b = merge_sort(array[(mid + 1)..n])  # sort second half
    # merge the two halves
    array_sorted = []
    array_a.each do |num|
      until array_b.empty? || array_b.first >= num  # (aka: while b < a)
        # If 2 elements are equal, ">=" maintains stability.
        #   (skips until block, so that array_a element is added first)
        array_sorted << array_b.first
        array_b.shift
      end
      array_sorted << num
    end
    # add any remaining elements from array_b
    array_sorted += array_b unless array_b.empty?
    return array_sorted
  end
end



# method to more easily display multiple test results
def display_merge_sort(array, expected_array, test_msg)
  puts "==========================================="
  puts "\nInput array: " + test_msg
  p array
  result = merge_sort(array)
  puts "\nSorted array:"
  p result
  puts "\nExpected output is:"
  p expected_array
  puts "\n==========================================="
end

test_name = "Test simple array of 2 elements:"
unsorted = [2, 1]
expected = [1, 2]
display_merge_sort(unsorted, expected, test_name)

test_name = "Test with more elements (4):"
unsorted = [2, 4, 1, 3]
expected = [1, 2, 3, 4]
display_merge_sort(unsorted, expected, test_name)

test_name =  "test odd number of elements:"
unsorted = [5, 3, 1, 2, 6, 4, 7]
expected = [1, 2, 3, 4, 5, 6, 7]
display_merge_sort(unsorted, expected, test_name)

test_name =  "test when two elements have the same value:"
unsorted = [2, 3, 1, 5, 4, 2]
expected = [1, 2, 2, 3, 4, 5]
display_merge_sort(unsorted, expected, test_name)

test_name =  "Test when multiple elements remain in B array after all A added:"
unsorted = [2, 3, 1, 5, 6, 4]
expected = [1, 2, 3, 4, 5, 6]
display_merge_sort(unsorted, expected, test_name)

test_name =  "Test empty array:"
unsorted = []
expected = []
display_merge_sort(unsorted, expected, test_name)

test_name =  "Test zero:"
unsorted = [3, 2, 8, 0, 6]
expected = [0, 2, 3, 6, 8]
display_merge_sort(unsorted, expected, test_name)

test_name =  "Test negative numbers:"
unsorted = [4, 0, 3, -1, 9, -7]
expected = [-7, -1, 0, 3, 4, 9]
display_merge_sort(unsorted, expected, test_name)

test_name =  "Test multiple digit numbers:"
unsorted = [-10, -999, 3500, -3508, 2500, 0, 356, 1000000, -5, 4]
expected = [-3508, -999, -10, -5, 0, 4, 356, 2500, 3500, 1000000]
display_merge_sort(unsorted, expected, test_name)

test_name = "Test larger array with more duplicates"
unsorted = [5, 3, 100, 7, 6, 98, 8, 3, 5, 4, 2, 3, 9, 8, 6, 0, 3, 34, 12, 77]
expected = [0, 2, 3, 3, 3, 3, 4, 5, 5, 6, 6, 7, 8, 8, 9, 12, 34, 77, 98, 100]
display_merge_sort(unsorted, expected, test_name)

test_name =  "Test decimals and stability (-5 and -5.0 should maintain order):"
unsorted = [3.55, 3.5, -4.6754, 5, -5, -5.0, 0, -4.6, -4.7]
expected = [-5, -5.0, -4.7, -4.6754, -4.6, 0, 3.5, 3.55, 5]
display_merge_sort(unsorted, expected, test_name)

test_name =  "Test strings:"
unsorted = ["hi", "HI", "Bye", "bye", "tHe", "The", "the"]
expected = ["Bye", "HI", "The", "bye", "hi", "tHe", "the"]
display_merge_sort(unsorted, expected, test_name)
