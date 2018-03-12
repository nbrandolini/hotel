require 'date'
module Hotel
  class Room
    attr_reader :number
    attr_accessor :rate

  def initialize (number)
    @number = check_room_number(number)
    @rate = 200
  end

  private

  def check_room_number(number)
    if number.is_a?(Integer) == false
      raise ArgumentError.new "Room number must be an integer"
    else
      @number = number
    end
  end

  end
end 
