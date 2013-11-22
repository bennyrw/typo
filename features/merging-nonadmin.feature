Feature: A non-admin cannot merge two articles
  As the blog admin
  In order to prevent uncontrolled merging of articles
  I want to prevent non-admins from merging articles

  Background:
    Given the blog is set up
    And I am logged in as publisherOne

  Scenario: Merging option not shown on edit article page
    Given I am on the new article page
    And I fill in "article_title" with "My article"
    And I fill in "article__body_and_extended_editor" with "My content"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "My article"
    When I follow "My article"
    Then I should see "My content"
    But  should not see "Merge"

  Scenario: Merging option not shown on new article page
    Given I am on the new article page
    Then I should not see "Merge"
