Feature: Cannot merge articles until they are created
  As a blog admin
  In order to have something to merge
  I want to only allow merging once an article is created

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Merging option not shown on new article page
    Given I am on the new article page
    Then I should not see "Merge"
