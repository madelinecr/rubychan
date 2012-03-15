require 'open-uri'
require 'nokogiri'

module RubyChan
  class Scraper

    attr_accessor :imagelinks

    def initialize(uri)
      @uri = uri
      @imagelinks = ""
    end

    def scrape
      doc = Nokogiri::HTML(open(@uri))
      doc.xpath('//a').each do |link|
        if(link['href'] =~ /http:\/\/images.4chan.org\/.\/src\/.+/)
          @imagelinks.concat "#{link['href']}\n"
        end
      end
    end
  end
end
