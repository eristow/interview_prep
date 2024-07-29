# Given an N x M matrix, containing distinct elements, return all special values.
# Note: A special value in the matrix is an element that is the minimum element in its row and the maximum element in its column.

# find elements that are min in row, max in column
# min_rows = []
# max_cols = []
# num_rows = matrix.size - 1
# num_cols = matrix[0].size - 1

# find list of mins in rows
# for 0 -> num_rows (i)
#		min_value = 9999
# 	for 0 -> num_cols (j)
#			if matrix[i][j] < min_value, min_value = matrix[i][j]
#		min_rows[i] = min_value
#		
# find list of maxes in columns
# for 0 -> num_cols (j)
#		max_value = -1
# 	for 0 -> num_rows (i)
#			if matrix[i][j] > max_value, max_value = matrix[i][j]
#		max_cols[j] = min_value
#
# find shared vals b/t min_rows, max_cols
#	output = []
# for min in min_rows
#		for max in max_cols
#			if min == max
#				output.push(min)
# return output

def special_values(matrix)
	min_rows = []
	max_cols = []
	num_rows = matrix.size - 1
	num_cols = matrix[0].size - 1

	# find list of mins in rows
	(0..num_rows).each do |i|
		min_value = 9999
		(0..num_cols).each do |j|
			min_value = [min_value, matrix[i][j]].min
		end
		min_rows[i] = min_value
	end

	# find list of maxes in columns
	(0..num_cols).each do |j|
		max_value = -1
		(0..num_rows).each do |i|
			max_value = [max_value, matrix[i][j]].max
		end
		max_cols[j] = max_value
	end

	# find shared vals b/t min_rows, max_cols
	puts(min_rows.inspect)
	puts(max_cols.inspect)
	output = []
	for min in min_rows
		for max in max_cols
			if min == max
				output.push(min)
			end
		end
	end

	output
end

puts("--- TEST 1 ---")
matrix = [
	[1, 2],
	[3, 4]
]
puts(special_values(matrix).inspect)
# expect [3]

puts("--- TEST 2 ---")
matrix = [
	[1, 2, 5],
	[4, 8, 3],
	[9, 7, 6]
]
puts(special_values(matrix).inspect)
# expect [6]

puts("--- TEST 3 ---")
matrix = [
	[1 , 2 , 5 , 10],
	[4 , 8 , 3 , 11],
	[25, 26, 27, 12]
]
puts(special_values(matrix).inspect)
# expect [6]
