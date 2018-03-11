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

      def get_reservation_by_date(date)
        reservations_by_date = []
        @reservations.each do |res|
          if res.include_date?(date)
          end
            reservations_by_date << res
        end
        return reservations_by_date
      end

      def include_date?(date)
        date.between?(@check_in, @check_out - 1)
      end

    private

      def validate_date(date)
        if date.is_a? (Date)
          return date
        else
          raise ArgumentError.new "Argument must be a date."
        end

      end




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
end
