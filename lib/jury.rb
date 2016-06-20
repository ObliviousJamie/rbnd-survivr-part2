class Jury
    attr_accessor :members
    #attr_reader :members

    def initialize
        @members = Array.new
    end

    def add_member(member)
        @members << member
    end

    def cast_votes(finalist)
        votes = Hash.new{|hash, key| hash[key] = 0}
        #Adding each finalist to a hash for voting process
        finalist.each do |final|
            votes[final]
        end
        
        #Each member in jury votes for a finalist randomly
        @members.each do |member|
            voting_for = votes.keys.sample
            votes[voting_for] += 1
            puts "#{member.name} votes for #{voting_for}"
        end
        return votes
    end

    def report_votes(final_votes)
        final_votes.each do |finalist|
            puts "#{finalist[0]} has #{finalist[1]} votes" 
        end
    end

    def announce_winner(final_votes)
        final_votes.max_by{|key,value| value}[0]
    end


end
