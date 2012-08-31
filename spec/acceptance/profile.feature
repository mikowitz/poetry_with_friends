Feature: Viewing user profiles
  Background:
    Given there is a user "Jeffrey"
    And   I am logged in as "Michael"

  Scenario: viewing my profile
    When I view my profile
    Then I should see the header "My Poems"
    And  I should see the header "My Prompts"

  Scenario: viewing Jeffrey's profile
    When I view the profile for Jeffrey
    Then I should see the header "Jeffrey's Poems"
    And  I should see the header "Jeffrey's Prompts"
