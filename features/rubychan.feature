Feature: Scraping 4chan
  In order to scrape 4chan
  A user presents a URI to a thread

  Scenario: Scraping a URI
    Given a URI
    When I call scrape
    Then HTML should be returned
