class BasketballScoreScraper::CLI

  def self.run
    games_data = BasketballScoreScraper::Scraper.scrap
    BasketballScoreScraper::Game.create_from_collection(games_data)
    if BasketballScoreScraper::Game.all.count == 0
      puts "No games were played last night."
    else
      BasketballScoreScraper::Game.all.each {|game| game.display}
    end
  end

end
