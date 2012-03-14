Given /^a URI$/ do
  @uri = "http://4chan.org"
end

When /^I call scrape$/ do
  @runner = RubyChan::Runner.new
  @runner.scrape(@uri)
end

Then /^HTML should be returned$/ do
  STDOUT.should_not be_nil
end
