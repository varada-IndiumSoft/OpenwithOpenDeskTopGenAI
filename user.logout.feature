Feature: Log Out

  Scenario: Successful log out
    Given I am logged in and on the chat interface
    When I click the log out button
    Then I should be logged out
    And I should be redirected to the login page

  Scenario: Log out from another page
    Given I am logged in and on a different page "profile page"
    When I click the log out button
    Then I should be logged out
    And I should be redirected to the login page

  Scenario: Log out with unsaved data
    Given I am logged in and on the chat interface
    And I have typed a message but not sent it
    When I click the log out button
    Then I should see a confirmation prompt "You have unsaved data. Do you really want to log out?"
    When I confirm the prompt
    Then I should be logged out
    And I should be redirected to the login page

  Scenario: Log out with an expired session
    Given I was logged in and on the chat interface
    And my session has expired
    When I click the log out button
    Then I should be redirected to the login page
    And I should see a message "Your session has expired. Please log in again."

  Scenario: Log out and attempt to access protected page
    Given I am logged in and on the chat interface
    When I click the log out button
    And I try to access the chat interface directly via URL
    Then I should be redirected to the login page
    And I should see a message "Please log in to access this page."

  Scenario: Log out and log in again
    Given I am logged in and on the chat interface
    When I click the log out button
    Then I should be logged out
    And I should be redirected to the login page
    When I enter a valid username "existinguser"
    And I enter a valid password "Password123!"
    And I click the login button
    Then I should be logged in successfully
    And I should be redirected to the chat interface

  Scenario: Log out multiple times
    Given I am logged in and on the chat interface
    When I click the log out button
    Then I should be logged out
    And I should be redirected to the login page
    When I log in again with a valid username "existinguser" and password "Password123!"
    And I click the log out button again
    Then I should be logged out
    And I should be redirected to the login page

  Scenario: Log out during an active session
    Given I am logged in and actively chatting
    When I click the log out button
    Then I should be logged out
    And I should be redirected to the login page
