require 'thor'

require 'scraper'

module RubyChan
  class Runner < Thor

    desc "Scrape URL", "Scrape a 4chan URL"
    def scrape(uri)
      @scraper = RubyChan::Scraper.new(uri)
      @scraper.scrape
      puts @scraper.imagelinks
    end
  end
end
