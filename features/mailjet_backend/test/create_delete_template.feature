@MailjetFeature
@api_scenario
Feature: Create and Delete a template

  Scenario: Verify Creating and Deleting of a template
    Given I have to get the size of the list of all templates
    When I created a new template
    Then I should verify if the list of all templates increased by one
    When I deleted the last created template
    Then I should check if the list of all templates decreased by one

#    cucumber --require features features/mailjet_backend/test/create_delete_template.feature