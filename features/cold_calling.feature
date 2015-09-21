Feature: Cold Call a Prospect
  Background:
    Given my user exists
    And the SNDA prospect exists with the contact "Grace Wu"
    And the SNDA prospect is assigned to me
    And I am logged in

  @javascript
  Scenario: A user cold calls a prospect and logs the events
    When I visit the prospects page
    And I click on "Grace Wu"
    And I sleep for 0.25 seconds
    Then I should be on the SNDA prospect page
    When I call and log a Voicemail event
    And the SNDA prospect's last event should be Voicemail
    Then I should see a Voicemail event on row 1
    When I call and log a Callback Later event
    And the SNDA prospect's last event should be Callback Later
    Then I should see a Callback Later event on row 2
    When I call and log a Requested Email event
    And the SNDA prospect's last event should be Requested Email
    Then I should see a Requested Email event on row 3
    When I call and log a Scheduled Demo event
    Then I should see a Scheduled Demo event on row 4
    And the SNDA prospect's last event should be Scheduled Demo

# test that an alert is shown when the API errors
# test that the short cut c/e works, that you can't open two at the same time
