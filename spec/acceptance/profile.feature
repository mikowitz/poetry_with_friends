Feature: Viewing user profiles
  Background:
    Given there is a user Jeffrey
    And   I am logged in as Michael

  Scenario: viewing my profile
    When I view my profile
    Then I should see "My Poems"
    And  I should see "My Prompts"
    And  I should see "My Settings"
    And  I should not see "Follow Michael"
    And  I should not see "Stop following Michael"

  Scenario: viewing Jeffrey's profile
    When I view the profile for Jeffrey
    Then I should see "Jeffrey's Poems"
    And  I should see "Jeffrey's Prompts"
    And  I should not see "My Settings"
    But  I should see "Follow Jeffrey"

  Scenario: following Jeffrey
    Given I follow Jeffrey
    When I view the profile for Jeffrey
    Then I should see "Stop following Jeffrey"
