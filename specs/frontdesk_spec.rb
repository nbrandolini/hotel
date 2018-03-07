require_relative 'spec_helper'

describe "Hotel::FrontDesk" do
  before do
    @guest = "Tom Hank"
  end
  describe "Initializer" do
    it "is an instance of FrontDesk" do
      reservation = Hotel::FrontDesk.new.must_be_kind_of Hotel::FrontDesk
    end

    it "establishes the base data structures when instantiated" do
      reservation = Hotel::FrontDesk.new
    end
  end

  describe "get_available_rooms" do
    it "gets a list of available rooms" do
      fd  = Hotel::FrontDesk.new
      date_begin = Date.new(2018, 03, 16)
      date_end = Date.new(2018, 03, 19)
      fd.make_reservation(@guest, date_begin, date_end)
      rooms = fd.get_available_rooms(date_begin - 3, date_end- 1)
      rooms.must_be_kind_of Array
    end
  end

end
