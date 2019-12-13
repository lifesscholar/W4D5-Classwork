# my_min

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# O(n^2) b/c we loop through twice, each loop is exponential
# def my_min(list)
#     list.each_with_index do |ele, i|
#         min = true
#         list.each_with_index do |ele2, i2|
#             next if i == i2
#             min = false if ele > ele2 
#         end
#         return ele if min 
#     end
# end
# p my_min(list)  # =>  -5

# O(n)
# iterate through the list just once while keeping track of the minimum.
# def my_min(list)
#     min = list.first
#     list.each do |ele|
#         min = ele if ele < min
#     end
#     min
# end

# p my_min(list)  # =>  -5


# O(n!)
# def largest_contiguous_subsum(array)
#     sub_arr = []
#     (0...array.length).each do |i|
#         (i...array.length).each do |i2|
#             sub_arr << array[i..i2]
#         end
#     end
#     max = sub_arr.first.sum
#     sub_arr.each do |ele|
#         max = ele.sum if max < ele.sum
#     end
#     max
# end


#O(1) memory means they don't want us to make any more arrays, just iterating
#through that one array
#O(n) time means they want us to go through the array once
def largest_contiguous_subsum(array)
    max = array.first 
    current_sum = 0
    array.each do |ele|
        current_sum += ele
        max = current_sum if current_sum > max
        current_sum = 0 if current_sum < 0
    end
    max
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

