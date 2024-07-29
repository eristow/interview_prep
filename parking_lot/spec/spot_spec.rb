require_relative '../lib/classes/spot'
require_relative '../lib/classes/vehicles'

RSpec.describe Spot, "#occupied" do
	# context "with no initial vehicle" do
	# end
	it "should be occupied when a vehicle is present" do
		# Arrange
		spot = Spot.new("motorcycle")
		motorcycle = Motorcycle.new()

		# Act
		spot.park(motorcycle)

		# Assert
		expect(spot.is_occupied?).to eq true
	end

	it "should NOT be occupied when a vehicle is NOT present" do
		# Arrange
		spot = Spot.new("motorcycle")

		# Act
		# Assert
		expect(spot.is_occupied?).to eq false
	end
end
