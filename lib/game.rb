class Game
    attr_reader :tribes

    def initialize(tribe_1, tribe_2)
        @tribe_1 = tribe_1
        @tribe_2 = tribe_2
        @tribes = [@tribe_1,@tribe_2]
    end

    def add_tribe(new_tribe)
        @tribes << new_tribe
    end

    #Random loser
    def immunity_challenge
        @tribes.sample 
    end

    #Random contestent loser
    def individual_immunity_challenge
        concat_tribes.members.sample 
    end

    def clear_tribes
        @tribes = Array.new
    end

    #Merges all existing tribes into one and removes old tribes
    def merge(new_tribe) 
        tribe = concat_tribes(new_tribe)
        clear_tribes
        add_tribe tribe
        return tribe
    end

    def concat_tribes(new_tribe = "")
        members = Array.new
        @tribes.each do |tribe|
            members.concat tribe.members
        end
        Tribe.new(name: new_tribe, members: members)  
    end

end
