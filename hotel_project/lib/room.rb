class Room

    def initialize(capacity)
        @capacity = capacity # int
        @occupants = []
    end


    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if @occupants.length < @capacity
            return false
        else
            return true
        end
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if !self.full?
            occupants.push(name)
            return true
        else
            return false
        end
    end


end