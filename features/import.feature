Feature: Import Prospects from CSV
  Scenario: An administrator loads the data from a CSV into the database
    Given a valid prospect CSV file
    When I import the prospect CSV file
    Then I should have a database of prospects
