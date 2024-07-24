Feature: Interact with Chatbot

  Scenario: Successful interaction with chatbot
    Given I am logged in and on the chat interface
    When I type "Hello" in the chat input
    And I click the send button
    Then I should see "Hello" displayed in the chat window from the user
    And I should see a response from the chatbot

  Scenario: Send an empty message
    Given I am logged in and on the chat interface
    When I leave the chat input empty
    And I click the send button
    Then I should see an error message "Message cannot be empty"

  Scenario: Send a long message
    Given I am logged in and on the chat interface
    When I type a message with 1000 characters "a...a" (1000 'a' characters)
    And I click the send button
    Then I should see the long message displayed in the chat window from the user
    And I should see a response from the chatbot

  Scenario: Send a message with special characters
    Given I am logged in and on the chat interface
    When I type a message with special characters "!@#$%^&*()"
    And I click the send button
    Then I should see the message with special characters displayed in the chat window from the user
    And I should see a response from the chatbot

  Scenario: Send a message with HTML tags
    Given I am logged in and on the chat interface
    When I type "<script>alert('Hello')</script>" in the chat input
    And I click the send button
    Then I should see the message "<script>alert('Hello')</script>" displayed in the chat window from the user as plain text
    And I should see a response from the chatbot

  Scenario: Send multiple quick successive messages
    Given I am logged in and on the chat interface
    When I type "First message" in the chat input
    And I click the send button
    And I type "Second message" in the chat input
    And I click the send button
    Then I should see "First message" and "Second message" displayed in the chat window from the user
    And I should see responses from the chatbot for both messages

  Scenario: Send a message after a long period of inactivity
    Given I am logged in and on the chat interface
    And I have been inactive for 30 minutes
    When I type "Hello again" in the chat input
    And I click the send button
    Then I should see "Hello again" displayed in the chat window from the user
    And I should see a response from the chatbot

  Scenario: Chatbot handles large volume of messages
    Given I am logged in and on the chat interface
    When I send 1000 messages in quick succession
    Then I should see all 1000 messages displayed in the chat window from the user
    And I should see responses from the chatbot for each message

  Scenario: Chatbot handles unexpected input
    Given I am logged in and on the chat interface
    When I type unexpected input "@3422"
    And I click the send button
    Then I should see "$533" displayed in the chat window from the user
    And I should see a response from the chatbot
