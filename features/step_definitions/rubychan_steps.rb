Given /^a valid URI$/ do
  @uri = "http://4chan.org"
  @html = <<-eos
    <html>
      <body>
        <a href="http://images.4chan.org/a/src/1.jpg"></a>
        <a href="http://images.4chan.org/b/src/2.jpg"></a>
      </body>
    </html>
  eos
  FakeWeb.register_uri(:get, "http://4chan.org", :body => @html)
end

When /^I call scrape$/ do
  @runner = RubyChan::Runner.new
  @runner.scrape(@uri)
end

Then /^I should see output$/ do
  STDOUT.should_not be_nil
end
