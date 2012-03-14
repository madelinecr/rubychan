require 'spec_helper'

describe RubyChan::Scraper do

  before :each do
    @uri = "http://4chan.org"
    @scraper = RubyChan::Scraper.new(@uri)
  end

  it "should open a URI" do
    @scraper.should_receive(:open).with(@uri)
    @scraper.scrape
  end

  it "should return HTML" do
    @scraper.scrape
    @scraper.html.should_not be_nil
  end
end
