require_relative 'spec_helper'

describe "Hotel::FrontDesk" do
  describe "Initializer" do
    it "is an instance of FrontDesk" do
      reservation = Hotel::FrontDesk.new.must_be_kind_of Hotel::FrontDesk
    end

    it "establishes the base data structures when instantiated" do
      reservation = Hotel::FrontDesk.new
    end
  end
end
