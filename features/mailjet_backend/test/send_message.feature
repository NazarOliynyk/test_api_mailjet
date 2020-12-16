@MailjetFeature
@api_scenario
  @Send_message
Feature: Send a message

  Scenario: Verify Sending of a message
    Given I have to get the size of the list of all sent messages and the size of list of all received messages
    When I sent a new message
    Then I should verify if the list of all sent messages increased by one
    And  I should verify if the list of received messages increased by one

#    cucumber --require features features/mailjet_backend/test/send_message.feature