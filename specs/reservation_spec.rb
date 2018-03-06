require_relative 'spec_helper'

describe "Reservation class" do
  describe "Initializer" do
    it "is an instance of Reservation" do
      reservation = Hotel::Reservation.new
      reservation.must_be_kind_of Hotel::Reservation
    end

    it "establishes the base data structures when instantiated" do
      reservation = Hotel::Reservation.new
    end
  end
end
