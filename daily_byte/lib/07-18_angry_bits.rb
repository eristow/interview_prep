# You are given an integer, n, and a binary number represented as an integer array, binary.
# Each of the one bits in binary must be separated by at least one zero bit otherwise the bits become angry.
# Return whether or not it’s possible to flip at least n zero bits to one bits without making the bits angry.

# O(n)
# for bit in binary
#		if at beginning, just check bit + 1 == 0
#		if at end, just check bit - 1 == 0
# 	if bit - 1 and bit + 1 are 0, subtract 1 from n
# 	
# 
# if n = 0, return true
# else, return false

def angry_bits(binary, n)
	count = n

	binary.each_with_index do |bit, i|
		if bit == 0
			if i == 0
				next_bit = binary[i + 1]

				count -= 1 if next_bit == 0
			elsif i == binary.size - 1
				prev_bit = binary[i - 1]

				count -= 1 if prev_bit == 0
			else
				next_bit = binary[i + 1]
				prev_bit = binary[i - 1]
				
				count -= 1 if next_bit == 0 && prev_bit == 0
			end
		end
	end

	if count > 0
		return false
	end

	true
end

puts("--- TEST 1 ---")
binary = [1, 0, 0, 1]
n = 1
puts(angry_bits(binary, n))
# expect false

puts("--- TEST 2 ---")
binary = [0, 1, 0, 0, 1, 0, 0, 0, 1]
n = 1
puts(angry_bits(binary, n))
# expect true
