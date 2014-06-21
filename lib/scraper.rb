require 'open-uri'
require 'nokogiri'

module RubyChan
  class Scraper

    def initialize(uri)
      @uri = uri
      @images = Hash[]
    end

    def scrape(options)
      @options = options
      puts options
      if options[:dryrun]
        puts "Dry run, pretending to download files..."
      end
      loop do
        begin
          parse_page
          download
        rescue OpenURI::HTTPError
          puts "Error, thread has 404'd"
          break
        end
      end
    end

    private

    def parse_page
      doc = Nokogiri::HTML(open(@uri))
      doc.xpath('//a').each do |link|
        if(link['href'] =~ /\/\/i.4cdn.org\/.+\/\d+\..../)
          uri = URI.parse("http:#{link['href']}")
          # Mark image as not downloaded yet in hash
          unless @images.has_key?(uri)
            @images[uri] = false
          end
        end
      end
    end

    def download
      @images.each_key do |image|
        if @images[image] == false
          unless @options[:dryrun]
            open(File.basename(image.path), "wb") {|f| f.write(image.read) }
          end
          puts "Downloaded #{image} to disk."
          # Mark image as downloaded so it isn't downloaded again in 
          # subsequent loops
          @images[image] = true
        end
      end
    end
  end
end
