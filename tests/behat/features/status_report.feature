@api
Feature: Status Report
  I want to ensure there are no errors on the status report page.

  Scenario: Assert there are no errors on the Status Report page.
    Given I am logged in as a user with the "administrator" role
    When I am on "admin/reports/status"
    Then I should see "PNWDS Behat Example"