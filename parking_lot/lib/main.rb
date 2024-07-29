require 'algorithms'
require 'active_support'

require_relative 'classes/vehicles'
require_relative 'classes/spot'
require_relative 'classes/level'
require_relative 'classes/parking_lot'

# TEST OBJECTS
# TODO: make testing easier with creation functions?
def main_parking_lot()
	spot_motorcycle_1 = Spot.new("motorcycle")
	spot_compact_1 = Spot.new("compact")
	spot_large_1 = Spot.new("large")
	spots_1 = [spot_motorcycle_1, spot_compact_1, spot_large_1]

	spot_motorcycle_2 = Spot.new("motorcycle")
	spot_compact_2 = Spot.new("compact")
	spot_large_2 = Spot.new("large")
	spots_2 = [spot_motorcycle_2, spot_compact_2, spot_large_2]

	level_1 = Level.new(spots_1)
	level_2 = Level.new(spots_2)
	levels = [level_1, level_2]

	parking_lot = ParkingLot.new(levels)
	puts("total_levels: #{parking_lot.total_levels}")
	puts("total_spots: #{parking_lot.total_spots}")
end

def main_algorithms
	arr = [5, 3, 10, 11, 22, 7, 1, 0, -8]
	sorted_arr = Algorithms::Sort.quicksort(arr)
	puts sorted_arr.inspect

	puts Algorithms::Search.binary_search(sorted_arr, 6)

	stack = Containers::Stack.new
	stack.push(3)
	stack.push(5)
	puts stack.pop
	puts stack.empty?
	puts stack.size

end

def main_active_support

end

# main_parking_lot
main_algorithms
# main_active_support
