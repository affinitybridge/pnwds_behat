@reinstall
Feature: Basic Page
  I want to check user permissions for basic pages.

  @api
  Scenario: Assert admin can create a page.
    Given I am logged in as a user with the "administrator" role
    When I am on "node/add/page"
    And I fill in the following:
      | Title         | Test Page            |
      | Body          | This is a test page. |
    And I press "Save"
    Then I should see the text "Basic page Test Page has been created."

  @api
  Scenario: Assert admin can edit a page.
    Given I am logged in as a user with the "administrator" role
    When I am on "node/1/edit"
    And I fill in the following:
      | Title         | Edited Test Page        |
      | Body          | This is a editted page. |
    And I press "Save"

  @api
  Scenario: Assert admin can delete a page.
    Given I am logged in as a user with the "administrator" role
    When I am on "node/1/edit"
    And I press "Delete"
    And I press "Delete"
    Then I should see "Basic page Edited Test Page has been deleted."

  @api
  Scenario: Assert anonymous users cannot edit a page.
    Given I am an anonymous user
    When I am viewing a "page" node with the title "anonymous user tests"
    When I go to "node/2/edit"
    Then the response status code should be 403

  Scenario: Assert Anonymous users cannot create a page.
    Given I am an anonymous user
    When I am on "node/add/page"
    Then the response status code should be 403

  @api
  Scenario: Assert Anonymous users can see a published page.
    Given I am an anonymous user
    When I am viewing a "page" node with the title "anonymous user tests"
    Then the response status code should be 200
