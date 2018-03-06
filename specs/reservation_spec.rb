require_relative 'spec_helper'

describe Hotel:: Reservation do
  before do
    @guest = "Tom Hank"
  end
    describe "can create a reservation instance" do
      it "can be created" do
        check_in = Date.new(2018, 03, 16)
        check_out = Date.new(2018, 03, 20)
        reservation = Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(1))
        reservation.must_be_instance_of Hotel::Reservation
    end

      it "accurately calculates the length of a stay of 1 night" do
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)
      reservation = Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(3))
      reservation.total_nights.must_equal 3
  end


    # it "establishes the base data structures when instantiated" do
    #   reservation = Hotel::Reservation.new(@guest, check_in, check_out,Hotel::Room.new)
    # end
  end
end
