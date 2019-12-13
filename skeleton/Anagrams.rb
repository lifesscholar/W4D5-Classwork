require "byebug"
#gives us an array of all possible permutations
#["a","b","c"].permutation.to_a.map{|ele|ele.join("")}
a ="gizmo"
b = "sally"
c = "elvis"
d = "lives"
# O(n!) because we're creating a permutation
def first_anagram?(str1, str2)
    str1.split("").permutation.map{|ele|ele.join("")}.include?(str2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# O(n^2)
def second_anagram?(str1, str2)
    arr1 = str1.split("")
    arr2 = str2.split("")
    arr1.each do |char|
        i = arr2.find_index(char)
        return false if i == nil
        arr2.delete_at(i)
    end
    arr2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# worst case .sort is O(n^2) quadratic/polynomial
# (nlog(n))
def third_anagram?(str1, str2)
    arr1 = str1.split("")
    arr2 = str2.split("")
    arr1.sort.join("") == arr2.sort.join("")
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


# O(n)
def fourth_anagram?(str1, str2)
    hash = Hash.new(0)
    str1.each_char do |char|
        hash[char] += 1
    end
    str2.each_char do |char|
        hash[char] -= 1
    end

    hash.all?{|k,v| v == 0}
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true