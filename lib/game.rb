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

    #Random winner
    def immunity_challenge
        @tribes.sample 
    end

    #Random contestent winner
    def individual_immunity_challenge
        @tribe_1.members.sample 
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

    #Merges tribes together with a new name which is blank by default
    #tribe_1 variable is now the new tribe
    def concat_tribes(new_tribe = "")
        members = Array.new
        @tribes.each do |tribe|
            members.concat tribe.members
        end
        @tribe_1 = Tribe.new(name: new_tribe, members: members)  
    end

end
