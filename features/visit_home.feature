Feature: Visit home
  Scenario: Home page shows welcome text
    When I go to the home page
    Then I should see "Hello Rubyists!"
