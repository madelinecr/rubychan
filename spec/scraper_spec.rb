require 'spec_helper'
require 'fakeweb'

describe RubyChan::Scraper do

  before :each do
    @uri = "http://4chan.org"
    @html = <<-eos
      <html>
        <body>
          <a href="//i.4cdn.org/a/src/1.jpg"></a>
          <a href="//i.4cdn.org/b/src/2.jpg"></a>
        </body>
      </html>
    eos
    FakeWeb.register_uri(:get, "http://4chan.org", :body => @html)
    @scraper = RubyChan::Scraper.new(@uri)
  end

  it "should open a URI" do
    @scraper.should_receive(:open).with(@uri)
    @scraper.scrape({ :singlerun => true })
  end

  it "should download image URIs from the page source" do
    @scraper.scrape
    @scraper.images.size.should == 2
  end
end
