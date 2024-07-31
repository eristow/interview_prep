# Given two strings, source and target, return the minimum number of subsequences of source that can be used to form target.
# Note: If it is impossible to use subsequences of source to form target, return -1.

=begin
find index where source[i] == target[j]
	then find how far substr of source matches with substr of target
	if no longer matching,
		reset source_ptr to start of source
		increment counter
		iterate until matching again
return counter
=end

# This is a solution to a diff problem... Misunderstood the ask...
# This doesn't allow for deletions of chars from source to create a substr.
#	It only allows for continous substrs
# Example: source = "xyz", target = "xzyxz" would be 5 because x + z + y + x + z
#		There are no continous substrs in source to create target except for single letters
def form_string_wrong(source, target)
	counter = 0
	src_ptr = 0
	tar_ptr = 0

	while tar_ptr < target.size do
		puts("counter: #{counter} | src_ptr: #{src_ptr} | tar_ptr: #{tar_ptr}")
		if src_ptr == source.size
			return -1
		elsif source[src_ptr] == target[tar_ptr] # check if rest of source == rest of target
			puts("source == target")
			substr_ptr = 1

			while substr_ptr do # TODO: fix, literally a while true...
				puts("substr_ptr: #{substr_ptr}")
				src_substr = source[src_ptr..src_ptr + substr_ptr]
				tar_substr = target[tar_ptr..tar_ptr + substr_ptr]
				puts("src_substr: #{src_substr} | tar_substr: #{tar_substr}")

				if src_substr != tar_substr || substr_ptr == source.size
					puts("src_substr != tar_substr")
					src_ptr = 0
					tar_ptr += substr_ptr
					counter += 1
					break
				else
					puts("increment substr_ptr")
					substr_ptr += 1
				end

			end
		else
			puts("increment src_ptr")
			src_ptr += 1
		end
	end

	return counter
end

def form_string(source, target)
	num_subsequences = 0
	remaining = target

	while remaining.size > 0 do
		puts("remaining: #{remaining} | num_subsequences: #{num_subsequences}")
		subsequence = ""
		source_ptr = 0
		remaining_ptr = 0

		while source_ptr < source.size && remaining_ptr < remaining.size do
			puts("subsequence: #{subsequence} | remaining: #{remaining} | source_ptr: #{source_ptr} | remaining_ptr: #{remaining_ptr}")
			if source[source_ptr] == remaining[remaining_ptr]
				puts("source_ptr == remaining_ptr")
				subsequence += remaining[remaining_ptr]
				remaining_ptr += 1
			end

			source_ptr += 1
		end

		if subsequence.empty?
			puts("subsquence empty")
			return -1
		end

		num_subsequences += 1
		puts("subsequence at end: #{subsequence} | remaining: #{remaining}")
		remaining = remaining[subsequence.size..remaining.size - 1]
	end

	return num_subsequences
end

puts("--- TEST 1 ---")
source = "abc"
target = "def"
puts(form_string(source, target))
# expect -1

puts("--- TEST 2 ---")
source = "abcdef"
target = "abcadaef"
puts(form_string(source, target))
# expect 3 (abc + ad + aef)

puts("--- TEST 3 ---")
source = "abc"
target = "abcbc"
puts(form_string(source, target))
# expect 2 (abc + bc)

puts("--- TEST 4 ---")
source = "abc"
target = "abdbc"
puts(form_string(source, target))
# expect -1

puts("--- TEST 5 ---")
source = "xyz"
target = "xzyxz"
puts(form_string(source, target))
# expect 3 (xz + y + xz)