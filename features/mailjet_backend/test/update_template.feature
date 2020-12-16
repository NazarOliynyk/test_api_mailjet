@MailjetFeature
@api_scenario
Feature: Update a template

  Scenario: Verify Updating of a template
    Given I have to make sure that there are templates in the list and get the id of the last existing template
    When I updated the existing template
    Then I should get it from the database and check if the template has been updated
    When I changed the field of the template back
    Then I should get it from the database and check if the template has been updated to previous state

#    cucumber --require features features/mailjet_backend/test/update_template.feature