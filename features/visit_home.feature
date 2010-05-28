Feature: Visit home
  Scenario: Home page shows welcome text
    When I go to the home page
    Then I should see "Hello Rubyists!"

  @culerity
  Scenario: Clicking link changes welcome message
    When I go to the home page
    And I click "Change greeting"
    Then I should see "Hello Pat!"