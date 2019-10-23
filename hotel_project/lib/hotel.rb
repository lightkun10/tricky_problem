require_relative "room"

class Hotel
  
    def initialize(name, capacities)
       @name = name
       @rooms = {}

       # iterate through each hash argument
       capacities.each do |room_name, capacity|
        #           key              value
            @rooms[room_name] = Room.new(capacity)
            # each room value become new instance of Room class
       end
    end


    def name
        split = @name.split(" ")
        # split.map!(&:capitalize).join(" ")
        split.map!{ |ele| ele.capitalize }.join(" ")
    end


    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        # check if the key is available
        # check if value is not full
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else # false
                puts "sorry room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end


    def has_vacancy? 
        if @rooms.values.any? { |room| room.available_space > 0 }
            return true
        else
            return false
        end
    end

    def list_rooms
        @rooms.each do |room_name, rooms|
            puts "#{room_name} #{rooms.available_space}"
        end
    end


end