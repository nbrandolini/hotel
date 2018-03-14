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

    it "raises an Argument Error for nil check_in" do
      check_in = nil
      check_out = Date.new(2018, 03, 20)

      error = proc{Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(1))}.must_raise ArgumentError
      error.message.must_equal "Invalid date"
    end

    it "raises an Argument Error for nil check_out" do
      check_in = Date.new(2018, 03, 16)
      check_out = nil

      error = proc{Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(1))}.must_raise ArgumentError
      error.message.must_equal "Invalid date"
    end

    it "accurately calculates the length of a stay of 1 night" do
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)
      reservation = Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(3))
      reservation.total_nights.must_equal 3
    end
  end

  describe "include_date?" do
    it "returns true if the date is between check_in and check_out" do
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)
      reservation = Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(3))
      date = Date.new(2018, 03, 17)
      reservation.include_date?(date).must_equal true
    end
    it "returns false if the date is not between check_in and check_out" do
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)
      reservation = Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(3))
      date = Date.new(2018, 03, 20)
      reservation.include_date?(date).must_equal false

    end
  end

  describe "total_cost" do
    it "calculates the total cost of one night" do
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 17)
      reservation = Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(3))
      reservation.total_cost.must_equal 200
    end

    it "calculates the total cost of multiple nights" do
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)
      reservation = Hotel::Reservation.new(@guest, check_in, check_out, Hotel::Room.new(3))
      reservation.total_cost.must_equal 600
    end
  end
end
