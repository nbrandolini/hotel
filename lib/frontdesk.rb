require 'date'
require 'pry'
module Hotel
  class FrontDesk

    ROOM_PRICE = 200
    attr_accessor :rooms, :reservations

    def initialize
      @rooms = create_rooms
      @reservations = []
    end

    def make_reservation(guest, check_in, check_out)
      avail_rooms = get_available_rooms(check_in, check_out)
      if avail_rooms.empty?
        raise StandardError.new("No room is available for this date range")
      else
        reservation = Hotel::Reservation.new(guest,check_in, check_out, avail_rooms.sample)
        @reservations << reservation
      end
      return reservation
    end

    def get_available_rooms(date_begin, date_end)
      available_rooms = @rooms.clone

      @reservations.each do |res|
        overlap = (res.check_in...res.check_out).to_a & (date_begin...date_end).to_a

        if overlap[0] != nil
          available_rooms.delete(res.room)
        end
      end
      return available_rooms
    end

    def get_reservation_by_date(date)
      reservations_by_date = []
      @reservations.each do |res|
        if res.include_date?(date)
          reservations_by_date << res
        end
      end
      return reservations_by_date
    end

    private

    def validate_date(date)
      if date.is_a? (Date)
        return date
      else
        raise ArgumentError.new "Argument must be a date."
      end

    end

    def create_rooms
      rooms = []
      (1..20).each do |num|
        rooms << Room.new(num)
      end
      return rooms
    end

  end
end
