class BasketballScoreScraper::Game
  attr_accessor :winner, :loser, :top_performers
  @@all = []

  def initialize(game_data)
    game_data.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(games_data)
    games_data.each do |game_data|
      self.new(game_data)
    end
  end

  def self.all
    @@all
  end

  def display
    puts
    printf("%-15s   %2s %2s %2s %2s %5s", " ", "1", "2", "3", "4", "Final")
    puts ""
    printf("%-15s   %2s %2s %2s %2s %5s", " ", "--", "--", "--", "--", "-----")
    puts ""
    printf("%-15s : %2s %2s %2s %2s %5s", winner[:name], winner[:q1], winner[:q2], winner[:q3], winner[:q4], winner[:final])
    puts ""
    printf("%-15s : %2s %2s %2s %2s %5s", loser[:name], loser[:q1], loser[:q2], loser[:q3], loser[:q4], loser[:final])
    puts
    print "Top Performers : "
    puts "#{top_performers[:pts][:player]} (#{top_performers[:pts][:points]} points), #{top_performers[:trb][:player]} (#{top_performers[:trb][:rebounds]} rebounds)"
    puts ""
  end

end
