Feature: Sending Tracked Emails to a Prospect
  Background:
    Given my user exists
    And the SNDA prospect exists with the contact "Grace Wu"
    And the SNDA prospect is assigned to me
    And I am logged in

  @javascript
  Scenario: A user emails a prospect
    When I visit the prospects page
    And I click on "Grace Wu"
    And I sleep for 0.125 seconds
    Then I should be on the SNDA prospect page
    # should focus on email
    # Then I send an email to "new.email@example.com"
    And I should see a sent email on row 3
    When the email is opened
    Then I should see an opened email on row 4
    When the email is clicked
    Then I should see a clicked email on row 5
    When the video is clicked
    Then I should see a clicked video on row 6
    When the signup is clicked
    Then I should see a clicked signup on row 7
