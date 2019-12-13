

arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false

#O(n^2)
def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |ele1,i|
        (arr[0...i] + arr[i+1..-1]).each do |ele2|
            return true if ele1 + ele2 == target_sum
        end
    end
    false
end

# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

# O(nlogn)
def okay_two_sum?(arr, target_sum)
    sorted = arr.merge_sort
    
    while sorted.length > 1
        sum = sorted.first + sorted.last
        finished = false
        if sum == target_sum
            return true
        elsif sum > target_sum
            sorted.pop
        else
            sorted.shift
        end
    end
    false
end


# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum(arr, target_sum)
    hash = {}
    arr.each do |ele|

    end
end

# def two_sum?(arr, target_sum)
#   complements = {}

#   arr.each do |el|
#     return true if complements[target_sum - el]
#     complements[el] = true
#   end

#   false
# end

arr = [0, 1, 5, 7]

# {
#     0 => true,
#     1 => true,
#     5 => true,
#     7 => true
# }