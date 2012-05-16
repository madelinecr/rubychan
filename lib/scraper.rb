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
        if(link['href'] =~ /\/\/images.4chan.org\/.\/src\/\d+\..../)
          uri = URI(link['href'])
          puts "Downloading #{uri}"
          Net::HTTP.start(uri.host) do |http|
            resp = http.get(uri.path)
            open(File.basename(uri.path), "wb") do |file|
              file.write(resp.body)
            end
          end
        end
      end
    end
  end
end
