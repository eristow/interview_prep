# Given a number n, return a list containing specific outputs for each value between one and n.
# For any number, if it is divisible by three and it is divisible by five, append “FizzBuzz” to your list.
# If it is divisible by only three, append “Fizz” to your list.
# If it is divisible by only five, append “Buzz” to your list.
# If the number is not divisible by three or five, simply append the number itself to the list. 

# output_arr = []
# for i from 1 -> n
#		next_str = ""
#		if i % 3 == 0
#			next_str += "Fizz"
#		if i % 5 == 0
#			next_str += "Buzz"
#		if i % 3 != 0 && i % 5 != 0
#			next_str += i.to_s
#		output_arr.push(next_str)
#	return output_arr

START = 1

RULES = [
	{num: 3, word: "Fizz"},
	{num: 5, word: "Buzz"}
]

def fizz_buzz(n)
	output_arr = []	

	(START..n).each do |num|
		next_str = ""

		for rule in RULES do
			if num % rule[:num] == 0
				next_str += rule[:word]
			end
		end

		if next_str.empty?
			next_str += num.to_s
		end

		output_arr.push(next_str)
	end

	return output_arr
end

puts("--- TEST 1 ---")
n = 3
puts(fizz_buzz(n).inspect)
# expect ["1","2","Fizz"]

puts("--- TEST 2 ---")
n = 5
puts(fizz_buzz(n).inspect)
# expect ["1","2","Fizz","4","Buzz"]

puts("--- TEST 3 ---")
n = 15
puts(fizz_buzz(n).inspect)
# expect ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
