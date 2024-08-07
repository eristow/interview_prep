# Given two strings s and t, return true if t is an anagram of s, and false otherwise.
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

=begin
time: O(s + t)
space: O(s) (technically, will only ever be 26 characters is only using lowercase alphabet)
create a hash map from s, where key = letter and value = num occurrences	
iterate through t, decrementing each letter when found
return true if hash map is empty
return false if hash map has any values

time: O((s + t) * (s * log s))
space: O(1) (if sorting doesn't take extra space (sometimes they take O(s)))
sort s and t
return s_sorted == t_sorted
=end

def is_anagram(s, t)
	return false if s.length != t.length

	letter_nums = Hash.new(0)

	s.each_char do |char|
		letter_nums[char] += 1
	end

	t.each_char do |char|
		if letter_nums.key?(char)
			if letter_nums[char] == 1
				letter_nums.delete(char)
			else
				letter_nums[char] -= 1
			end
		else
			return false
		end
	end

	if letter_nums.empty?
		return true
	else
		return false
	end
end

puts("--- TEST 1 ---")
s = "anagram"
t = "nagaram"
puts(is_anagram(s, t))
# expect true

puts("--- TEST 2 ---")
s = "rat"
t = "car"
puts(is_anagram(s, t))
# expect false
