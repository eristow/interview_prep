# TODO: solve using DP https://www.geeksforgeeks.org/longest-palindromic-substring/
# Given a string, s, which consists of only lowercase alphabetical characters, return the length of the longest palindrome you can form using its letters.

# n = s.length
# max_length = 1
# for i = 0 -> s.size - 1
#		for j = i -> s.size - 1
#			is_palindrome = true
#			for k = 0 -> (j - i + 1) / 2
#				if s[i + k] != s[j - k]
#					is_palindrome = false
#			if is_palindrome && (j - i + 1) > max_length
#				max_length = j - i + 1
#	return max_length

def palindrome(s)
	n = s.length
	max_length = 1
	start = 0

	(0..s.size - 1).each do |i|
		(i..s.size - 1).each do |j|
			is_palindrome = true

			current_length = j - i + 1
			halfway = current_length / 2

			(0..halfway).each do |k|
				if s[i + k] != s[j - k]
					is_palindrome = false
				end
			end

			if is_palindrome && current_length > max_length
				start = i
				max_length = current_length
			end
		end
	end

	puts(s[start..start + max_length - 1])
	return max_length
end

puts("--- TEST 1 ---")
s = "aa"
puts(palindrome(s))
# expect 2

puts("--- TEST 2 ---")
s = "abbcacacbbc"
puts(palindrome(s))
# expect 9

puts("--- TEST 3 ---")
s = "abcdracecarabcd"
puts(palindrome(s))
# expect 7
