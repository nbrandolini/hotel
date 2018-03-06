require 'date'

module Hotel
  class Reservation

    attr_reader  :guest, :check_in, :check_out, :room, :total_nights

    def initialize(guest, check_in, check_out, room)
      @room = room
      @check_in = check_in_date(check_in)
      @check_out = check_out_date(check_out)
      @guest = guest
      @total_nights = calculate_length


    end #initialize


    private

    def check_in_date(check_in)
      if check_in.is_a? (Date)
        @check_in = check_in
      else
        raise ArgumentError.new "Invalid check in date"
      end
    end

    def check_out_date(check_out)
      if check_in.is_a? (Date)
        @check_out = check_out
      else
        raise ArgumentError.new "Invalid check out date"
      end
    end

    def calculate_length
      if @check_in >= @check_out || @check_in < Date.today
        raise ArgumentError.new "invalid dates"
      else
        length = @check_out - @check_in
        return length.to_i
      end
    end

    # def request_reservation
    # end


  end
end
