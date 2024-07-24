Feature: Register Account

  Scenario: Successful registration with valid credentials
    Given I am on the registration page
    When I enter a valid username "newuser"
    And I enter a valid password "Password123!"
    And I confirm the password "Password123!"
    And I click the register button
    Then I should see a confirmation message "Registration successful"
    And I should be redirected to the login page

  Scenario: Registration with existing username
    Given I am on the registration page
    When I enter an existing username "existinguser"
    And I enter a valid password "Password123!"
    And I confirm the password "Password123!"
    And I click the register button
    Then I should see an error message "Username already taken"

  Scenario: Registration with password and confirmation mismatch
    Given I am on the registration page
    When I enter a valid username "newuser"
    And I enter a password "Password123!"
    And I confirm the password "Password321!"
    And I click the register button
    Then I should see an error message "Passwords do not match"

  Scenario: Registration with invalid password format
    Given I am on the registration page
    When I enter a valid username "newuser"
    And I enter an invalid password "pass"
    And I confirm the password "pass"
    And I click the register button
    Then I should see an error message "Password must be at least 8 characters long and contain an uppercase letter, a number, and a special character"

  Scenario: Registration with empty username
    Given I am on the registration page
    When I enter an empty username ""
    And I enter a valid password "Password123!"
    And I confirm the password "Password123!"
    And I click the register button
    Then I should see an error message "Username cannot be empty"

  Scenario: Registration with empty password
    Given I am on the registration page
    When I enter a valid username "newuser"
    And I enter an empty password ""
    And I confirm the password ""
    And I click the register button
    Then I should see an error message "Password cannot be empty"

  Scenario: Registration with username at character limit
    Given I am on the registration page
    When I enter a username with 30 characters "usernamethatisexactlythirtychar"
    And I enter a valid password "Password123!"
    And I confirm the password "Password123!"
    And I click the register button
    Then I should see a confirmation message "Registration successful"
    And I should be redirected to the login page

  Scenario: Registration with username exceeding character limit
    Given I am on the registration page
    When I enter a username with 31 characters "usernamethatisthirtyonecharacters"
    And I enter a valid password "Password123!"
    And I confirm the password "Password123!"
    And I click the register button
    Then I should see an error message "Username cannot exceed 30 characters"
