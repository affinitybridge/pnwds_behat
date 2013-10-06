@reinstall
Feature: Article
  I want to check user permissions for Articles.

  @api
  Scenario: Assert admin can create a article.
    Given I am logged in as a user with the "administrator" role
    When I am on "node/add/article"
    And I fill in the following:
      | Title         | Test article            |
      | Body          | This is a test article. |
    And I press "Save"
    Then I should see the text "Article Test article has been created."

  @api
  Scenario: Assert admin can edit a article.
    Given I am logged in as a user with the "administrator" role
    When I am on "node/1/edit"
    And I fill in the following:
      | Title         | Edited Test article        |
      | Body          | This is a editted article. |
    And I press "Save"
    Then I should see the text "Article Edited Test article has been updated."

  @api
  Scenario: Assert admin can delete a article.
    Given I am logged in as a user with the "administrator" role
    When I am on "node/1/edit"
    And I press "Delete"
    And I press "Delete"
    Then I should see "Article Edited Test article has been deleted."

  @api
  Scenario: Assert anonymous users cannot edit a article.
    Given I am an anonymous user
    When I am viewing a "article" node with the title "anonymous user tests"
    When I go to "node/2/edit"
    Then the response status code should be 403

  Scenario: Assert Anonymous users cannot create a article.
    Given I am an anonymous user
    When I am on "node/add/article"
    Then the response status code should be 403

  @api
  Scenario: Assert Anonymous users can see a published article.
    Given I am an anonymous user
    When I am viewing a "article" node with the title "anonymous user tests"
    Then the response status code should be 200
