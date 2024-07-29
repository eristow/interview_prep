class Level
	attr_reader :spots

	def initialize(spots)
		@spots = spots
	end

	def total_spots()
		return spots.count
	end
end
