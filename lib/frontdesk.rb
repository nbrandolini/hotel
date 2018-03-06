require 'date'
module Hotel
  class FrontDesk

    ROOM_PRICE = 200
    attr_accessor :rooms, :reservations

    def initialize
      @rooms = get_rooms
      @reservations = get_reservations
    end

    def access_rooms
    end

    def reserve_room
    end

    def access_reservations
    end

    def total_cost
    end

    all_rooms = (1..20)

  end
end
