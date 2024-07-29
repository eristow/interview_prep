class ParkingLot
  attr_reader :levels

  def initialize(levels)
    @levels = levels
  end

  def total_levels()
    levels.count
  end

	def total_spots()
		levels.reduce(0) { |sum, level| sum + level.total_spots}
	end
end
