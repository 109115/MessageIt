Feature: Login field validation scenarios

  Scenario: Send Message
    Given Launch Window
    And I click on the new chat menu
    And I enter the user name in contacts
#    And I enter the name or mobile no in the search field
    And I click on the contact no/name
    And I enter the text in message
    And I click on the submit button
    And I send message to rest of the contact
