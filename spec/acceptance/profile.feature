Feature: Viewing user profiles
  Background:
    Given there is a user Jeffrey
    And   I am logged in as Michael

  Scenario: viewing my profile
    When I view my profile
    And  I should not be able to follow myself

  Scenario: viewing Jeffrey's profile
    When  I view the profile for Jeffrey
    Then  I should be able to follow Jeffrey

  Scenario: following Jeffrey
    Given I follow Jeffrey
    When I view the profile for Jeffrey
    Then I should be able to stop following Jeffrey
