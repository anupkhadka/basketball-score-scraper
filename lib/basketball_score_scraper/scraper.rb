class BasketballScoreScraper::Scraper

  def self.scrap
    games_data = []
    html_doc = Nokogiri::HTML(open("https://www.basketball-reference.com/boxscores/"))
    game_summaries = html_doc.css(".game_summaries .game_summary.expanded.nohover")
    game_summaries.each do |game_summary|
      game_data = scrap_game_summary(game_summary)
      games_data << game_data
    end
    games_data
  end

  def self.scrap_game_summary(game_summary)
    game_data =
    {
      :winner => {},
      :loser => {},
      :top_performers =>
      {
        :pts => {},
        :trb => {}
      }
    }

    game_summary.css("table").each do |table|
      if table.attribute('class') && table.attribute('class').value == "teams"
        rows = table.css('tbody tr')
        rows.each do |row|
          if row.attribute('class').value == "winner"
            game_data[:winner][:name] = row.css('td')[0].text
            game_data[:winner][:final] = row.css('td')[1].text
          else
            game_data[:loser][:name] = row.css('td')[0].text
            game_data[:loser][:final] = row.css('td')[1].text
          end
        end
      elsif table.attribute('class') && table.attribute('class').value == "stats"
        rows = table.css('tbody tr')
        rows.each do |row|
          if row.css('td')[0].text == "PTS"
            game_data[:top_performers][:pts][:player] = row.css('td')[1].text
            game_data[:top_performers][:pts][:points] = row.css('td')[2].text
          elsif row.css('td')[0].text == "TRB"
            game_data[:top_performers][:trb][:player] = row.css('td')[1].text
            game_data[:top_performers][:trb][:rebounds] = row.css('td')[2].text
          end
        end
      else
        rows = table.css('tbody tr')
        rows.each do |row|
          # The team name includes a non-breaking space. Use gsub to sub that with
          # regular space then strip the trailing space.
          team_name = row.css('td')[0].text.gsub(/[[:space:]]/, ' ').strip!
          if team_name == game_data[:winner][:name]
            game_data[:winner][:q1] = row.css('td')[1].text
            game_data[:winner][:q2] = row.css('td')[2].text
            game_data[:winner][:q3] = row.css('td')[3].text
            game_data[:winner][:q4] = row.css('td')[4].text
          else
            game_data[:loser][:q1] = row.css('td')[1].text
            game_data[:loser][:q2] = row.css('td')[2].text
            game_data[:loser][:q3] = row.css('td')[3].text
            game_data[:loser][:q4] = row.css('td')[4].text
          end
        end
      end
    end
    game_data
  end

end
