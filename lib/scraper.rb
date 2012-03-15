require 'open-uri'
require 'nokogiri'

module RubyChan
  class Scraper
    
    def initialize(uri)
      @uri = uri
    end

    def scrape
      doc = Nokogiri::HTML(open(@uri))
      doc.xpath('//a').each do |link|
        if(link['href'] =~ /http:\/\/images.4chan.org\/.\/src\/.+/)
           puts link['href']
        end
      end
    end
  end
end
