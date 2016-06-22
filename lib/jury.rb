class Jury
    attr_accessor :members
    #attr_reader :members

    def initialize
        @members = Array.new
    end

    #Used to print a message to termial with a divider
    def notify_to_terminal(options={})
        divider = options[:divide]
        string = options[:string]
        puts "#{divider} #{string} #{divider} "
    end

    def add_member(member)
        @members << member
    end

    #Every member of jury votes for a random finalist
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
            puts "#{member.name.pink} votes for #{voting_for.name.light_grey}"
        end
        return votes
    end

    #Finalists have the numbers of votes they have printed to terminal
    def report_votes(final_votes)
        final_votes.each do |finalist|
            puts "#{finalist[0]} has #{finalist[1]} votes" 
        end
    end

    #Winner is printed to terminal
    def announce_winner(final_votes)
        winner = final_votes.max_by{|key,value| value}[0]
        notify_to_terminal divide: "-"*4, string: "Winner is... #{winner.name.green}!"
        return winner
    end


end
