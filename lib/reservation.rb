require 'date'

module Hotel
  class Reservation

    attr_reader  :guest, :check_in, :check_out, :room, :total_nights

    def initialize(guest, check_in, check_out, room)
      @room = room
      @check_in = validate_date(check_in)
      @check_out = validate_date(check_out)
      @guest = guest
      @total_nights = calculate_length
    end

    def include_date?(date)
      date.between?(@check_in, @check_out - 1)
    end

    def total_cost
      @total_nights * 200
    end

    private

    def validate_date(date)
      if date.is_a? (Date)
        return date
      else
        raise ArgumentError.new "Invalid check in date"
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

  end
end
