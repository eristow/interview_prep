# Given a non-negative integer x, return its square root.
# Note: You may not use a built in square root function and decimals should be truncated to return an integer value.

# x to the 1/2 power

# use binary search

def square_roots_math(x)
	return (x ** 0.5).floor()
end

def square_roots(x)
	if x == 0 || x == 1
		return x
	end

	left = 1
	right = x
	mid = -1

	while left < right - 1 do
		mid = (left + right) / 2
		square_mid = (mid * mid).floor
		puts("#{left} | #{mid} | #{right} | #{square_mid}")

		if square_mid == x
			return mid
		elsif square_mid > x
			right = mid
		else
			left = mid
		end

	end


	return left
end

puts("--- TEST 1 ---")
x = 9
puts(square_roots(x))
# expect 3

puts("--- TEST 2 ---")
x = 12
puts(square_roots(x))
# expect 3

puts("--- TEST 3 ---")
x = 81
puts(square_roots(x))
# expect 9
