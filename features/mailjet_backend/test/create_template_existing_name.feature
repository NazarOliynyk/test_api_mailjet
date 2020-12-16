@MailjetFeature
@api_scenario
Feature: Create a template with existing name

  Scenario: Verify Creating a template with existing name
    Given I have to make sure that there are templates in the list and get the name of the last existing template
    Then I set to the template model existing name and verify the response


#    cucumber --require features features/mailjet_backend/test/create_template_existing_name.feature