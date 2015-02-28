Feature: The Homepage
  As a contributor, or organisation
  I want to find out more about the cause
  So that I can decide if i want to contribute

  Scenario: Learning about the cause
    Given I am on the homepage
    And I want to find out more about Oodls
    When I click on About Me
    Then I should be able to learn about Oodls
