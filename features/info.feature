Feature: Let people get to know stuff about the site
  In order let people know what's going on with the site
  As a site admin
  I want to show people basic information

  Scenario: Home page
    Given I am an anonymous user
    When I am on the homepage
    Then I should see "Welcome to RailsBridge Book Club"
  