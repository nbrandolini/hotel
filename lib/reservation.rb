require 'date'

module Hotel
  class Reservation

    attr_accessor :rooms, :check_in, :check_out, :cost

    def initialize
      @rooms = rooms
      @check_in = check_in
      @check_out = check_out
      @cost = cost

    end #initialize


    def duration
      if check_in == nil || check_out == nil
        raise ArgumentError.new ("Invalid date")
      else
        return duration = (@check_out - @check_in)
      end
    end  # duration

    def request_reservation
    end

    
  end
end
