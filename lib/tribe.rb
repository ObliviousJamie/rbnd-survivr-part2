class Tribe
    attr_reader :name, :members

    def initialize(options = {})
        @name = options[:name]
        @members = options[:members]

        puts "Tribe #{@name.red} created"
    end

    #Tribal council removes a member from the tribe who is not immune
    #This will print information to terminal
    def tribal_council(options={})
        divider = "*"
        options[:immune] ? immune = options[:immune] : immune = "None"
        victim = @members.sample
        (victim = @members.sample) until victim != immune
        puts "#{divider} #{victim.name.pink} has been voted out! Member who has immunity: #{immune.name.blue unless immune == "None"} #{divider}"
        @members.delete(victim)
    end

    def to_s
        @name
    end

end
