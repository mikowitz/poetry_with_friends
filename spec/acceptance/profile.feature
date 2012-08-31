Feature: Viewing user profiles
  Background:
    Given there is a user "jeffrey@test.com"
    And   I am logged in as "michael@test.com"

  Scenario: viewing my profile
    When I view my profile
    Then I should see the header "My Poems"
    And  I should see the header "My Prompts"

  Scenario: viewing Jeffrey's profile
    When I view the profile for "jeffrey@test.com"
    Then I should see the header "jeffrey@test.com's Poems"
    And  I should see the header "jeffrey@test.com's Prompts"
