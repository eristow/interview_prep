# You are given two rectangles as integer arrays and want to determine if they overlap.
# Each rectangle will be given as two point, [x1, y1, x2, y2] where (x1, y1) represents the bottom-left hand corner a rectangle and (x2, y2) represents the top-right hand corner of a rectangle.
# Given two arrays that represent rectangles, rect1 and rect2, return whether or not they overlap.
# Note: Two rectangles overlap if the area of their intersection is positive.

# rect1_c1, rect1_c2, rect1_c3, rect1_c4 = ...
# for corner in rect1_corners
#		if corner[x] > rect2[0][x] && corner[x] < rect2[1][x] && corner[y] > rect2[0][y] && corner[y] < rect2[1][y]
#			return true
#	return false

# rect1[x1] < rect2[x2] && rect1[x2] > rect2[x1] && rect1[y1] < rect2[y2] && rect1[y2] > rect2[y1]

def overlap(rect1, rect2)
	rect1_x1 = rect1[0]
	rect1_y1 = rect1[1]
	rect1_x2 = rect1[2]
	rect1_y2 = rect1[3]
	rect2_x1 = rect2[0]
	rect2_y1 = rect2[1]
	rect2_x2 = rect2[2]
	rect2_y2 = rect2[3]

	return rect1_x1 < rect2_x2 && rect1_x2 > rect2_x1 && rect1_y1 < rect2_y2 && rect1_y2 > rect2_y1
end

puts("--- TEST 1 ---")
rect1 = [0, 0, 1, 1]
rect2 = [0, 0, 3, 3]
puts(overlap(rect1, rect2))
# expect true

puts("--- TEST 2 ---")
rect1 = [0, 0, 1, 1]
rect2 = [1, 1, 4, 4]
puts(overlap(rect1, rect2))
# expect false
