# BasketballScoreScraper

This gem uses nokogiri to web scrap NBA game scores from last night from basketball-reference.com
This is a perfect utility gem for someone who spends a lot of time in front of the terminal and who is also an avid basketball fan that wants to know last night's score without opening a web browser.

## Installation

Download the source code. An executable called 'basketball_score_scraper' inside bin directory can be executed directly.

To build a gem, run the following command in the root directory of this application:

```console
gem build basketball_score_scraper.gemspec
```

This will build a ruby gem for you which you can install. To install this gem, do:

```console
gem install basketball_score_scraper-0.1.0.gem
```

This will install an executable called basketball_score_scraper in your machine. You should be able to execute this executable from anywhere now.

## Usage

Once installed, you can launch the executable from your shell:

Example usage:
```console
~> basketball_score_scraper

                   1  2  3  4 Final
                  -- -- -- -- -----
Milwaukee       : 35 29 31 30   125
Toronto         : 21 18 39 25   103
Top Performers : K. Leonard-TOR (31 points), G. Antetokounmpo-MIL (17 rebounds)

~>
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
