require 'date'
module Hotel
  class Room
    attr_reader :number
    attr_accessor :rate

  def initialize (number)
    @number = check_room_number(number)
    @rate = 200
  end

  private # Raise arument error if room number is not an integer or is already taken

  def check_room_number(number)
    if number.is_a?(Integer) == false
      raise ArgumentError.new "Room number must be an integer"
    else
      @number = number
    end
  end

end # class
end # module
