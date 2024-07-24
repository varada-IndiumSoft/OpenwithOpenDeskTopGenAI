Feature: Log In

  Scenario: Successful login with valid credentials
    Given I am on the login page
    When I enter a valid username "existinguser"
    And I enter a valid password "Password123!"
    And I click the login button
    Then I should be logged in successfully
    And I should be redirected to the chat interface

  Scenario: Login with incorrect password
    Given I am on the login page
    When I enter a valid username "existinguser"
    And I enter an incorrect password "WrongPassword!"
    And I click the login button
    Then I should see an error message "Incorrect username or password"

  Scenario: Login with non-existent username
    Given I am on the login page
    When I enter a non-existent username "nonexistentuser"
    And I enter a valid password "Password123!"
    And I click the login button
    Then I should see an error message "Incorrect username or password"

  Scenario: Login with empty username
    Given I am on the login page
    When I leave the username field empty
    And I enter a valid password
