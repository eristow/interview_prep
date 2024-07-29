class Spot
  attr_reader :type, :vehicle

  def initialize(type)
    @type = type
    @vehicle = nil
  end

  def is_occupied?()
    return !vehicle.nil?
  end

  def park(vehicle)
    @vehicle = vehicle
  end
end
