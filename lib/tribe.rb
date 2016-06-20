class Tribe
    attr_reader :name, :members

    def initialize(options = {})
        @name = options[:name]
        @members = options[:members]

        puts "Tribe #{@name} created"
    end

    def tribal_council(options={})
        immune = options[:immune]
        victim = @members.sample
        (victim = @members.sample) until victim != immune
        @members.delete(victim)
    end

    def to_s
        @name
    end

end
