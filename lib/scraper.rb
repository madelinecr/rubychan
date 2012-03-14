require 'open-uri'

module RubyChan
  class Scraper
    
    attr_accessor :html

    def initialize(uri)
      @uri = uri
    end

    def scrape
      open(@uri) {|f| @html = f.read }
    end
  end
end
