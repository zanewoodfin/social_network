Feature: Login
  In order to access more content
  As a valid user
  I want to be able to login

  Scenario: Visiting the login page
    Given I am on the home page
    When I click "Login"
    Then I should be on login page

  Scenario: Logging in with valid credentials
    Given I am on the login page
    And I have valid credentials
    When I fill in "session_email" with "zanewoodfin@gmail.com"
    And I fill in "session_password" with "password"
    And I press "Login"
    Then I should be logged in

  Scenario: Logging out
    Given I am logged in
    When I click "Logout"
    Then I should be logged out
