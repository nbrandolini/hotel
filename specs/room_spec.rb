require_relative 'spec_helper'

xdescribe Hotel::Room do
  describe "Can create a room instance" do
    it "can be created" do
      room = Hotel::Room.new(1)
      room.must_be_instance_of Hotel::Room
    end

    it "raises an ArgumentError for invalid parameters" do
      proc{Hotel::Room.new("A76")}.must_raise ArgumentError
    end

    it "initializes with a cost of $200 per night" do
      room = Hotel::Room.new (7)
      room.rate.must_equal 200
    end
  end
end
