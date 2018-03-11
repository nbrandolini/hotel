require_relative 'spec_helper'

describe "Hotel::FrontDesk" do
  before do
    @guest = "Tom Hank"
  end
  describe "initialize" do
    it "is an instance of FrontDesk" do
      reservation = Hotel::FrontDesk.new.must_be_kind_of Hotel::FrontDesk
    end

    it "establishes the base data structures when instantiated" do
      reservation = Hotel::FrontDesk.new
    end

    it "creates instance of rooms" do
      rooms_in_hotel = Hotel::FrontDesk.new.rooms
      rooms_in_hotel.must_be_instance_of Array
      rooms_in_hotel.each do |room|
        room.must_be_instance_of Hotel::Room
        end
    end
    it "creates 20 rooms" do
      rooms_in_hotel = Hotel::FrontDesk.new.rooms
      rooms_in_hotel.length.must_equal 20
    end

    it "creates an empty array of reservations" do
      reservations_in_hotel = Hotel::FrontDesk.new.reservations
      reservations_in_hotel.must_be_kind_of Array
      reservations_in_hotel.length.must_equal 0
    end
  end

  describe "make_reservation" do
    it "creates a reservation" do
      frontdesk = Hotel::FrontDesk.new
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)
      new_res = frontdesk.make_reservation(@guest, check_in, check_out)
      new_res.must_be_instance_of Hotel::Reservation
    end

    it "adds a new reservation to the reservations array" do
      frontdesk = Hotel::FrontDesk.new
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)
      frontdesk.make_reservation(@guest, check_in, check_out)
      frontdesk.reservations.length.must_equal 1
      frontdesk.reservations.last.must_be_instance_of Hotel::Reservation
    end

    it "uses check_in and check_out dates for reservation" do
      # the dates on the reservation are the same ones that we passed into a method"
    end

    it "assigns a room" do
      #checks that the reservation instance has a room
    end

    it "raises a StandardError when they are no available rooms left" do
      frontdesk = Hotel::FrontDesk.new
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)

      20.times do
        frontdesk.make_reservation(@guest, check_in, check_out)
      end
      proc{frontdesk.make_reservation(@guest, check_in, check_out)}.must_raise StandardError
    end
  end

  describe "validate_date" do
    it "raises an ArgumentError when date is not in a valid format" do

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

  describe "get_reservation_by_date" do
    it "gets a list of reservations for a particular date" do
      fd = Hotel::FrontDesk.new
      date_begin = Date.new(2018, 03, 16)
      date_end = Date.new(2018, 03, 19)
      fd.make_reservation(@guest, date_begin, date_end)
      fd = Hotel::FrontDesk.new
      date_begin = Date.new(2018, 03, 14)
      date_end = Date.new(2018, 03, 17)
      fd.make_reservation(@guest, date_begin, date_end)
      res = fd.get_reservation_by_date(2018, 03, 16)
      res.length.must_equal 2
    end
  end
end
