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

    # TODO arg raise Argument Error for no available rooms

    def make_reservation(guest, check_in, check_out)
      # room = assign_room(check_in, check_out)
      @reservations << Reservation.new(guest, check_in, check_out, room)
    end


    def validate_date(date)
      if date.is_a? (Date)
        return date
      else
        raise ArgumentError.new "Invalid check in date"
      end

    end

    def create_rooms
      rooms = []
      (1..20).each do |num|
        rooms << Room.new(num)
      end
      return rooms
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
      reservation_by_date = []
      @reservations.each do |res|
        if res.include_date?(date)
          reservation_by_date << res
        end
      end
      return reservation_by_date
    end

    # TODO

    # def assign_room(check_in, check_out, room)
    #   available_rooms = get_available_rooms(check_in, check_out)
    #     raise StandardError.new "No more rooms available for that day", if available_rooms.empty?
    #
    #     available_rooms.each do |empty_room|
    #       if empty_room.number == room
    #         return empty_room
    #       end
    #     end
    #
    # end
    

  end
end
