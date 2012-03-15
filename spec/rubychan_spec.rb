require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Rubychan" do
  before :each do
    @runner = RubyChan::Runner.new
    @scraper = mock("Scraper").as_null_object
    RubyChan::Scraper.stub!(:new).and_return(@scraper)
    @uri = "http://4chan.org"
  end

  context "#scrape" do

    it "should scrape a URI" do
      @scraper.should_receive(:scrape)
      @runner.scrape(@uri)
    end

    it "should print stuff" do
      @runner.scrape(@uri)
      STDOUT.should_not be_nil
    end
  end
end
