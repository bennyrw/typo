Feature: Merging articles
  As the blog admin
  In order to prevent duplication of my content
  I want to support merging articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the all articles page

  Scenario: Merging results in content being combined
    Given I edit an article
    When I fill in "merge_with" with "Second article"
    And I press "Merge"
    Then I should be on the article page
    And I should see content from the first article
    And I should see content from the second article

  Scenario: Merging results in a single article
    Given I edit an article
    When I fill in "merge_with" with "Second article"
    And I press "Merge"
    When I goto the all articles page
    Then I should see "First article"
    But I should not see "Second article"

  Scenario: Merging results in one author being chosen
    Given I edit an article
    When I fill in "merge_with" with "Second article"
    And I press "Merge"
    Then I should be on the article page
    And I should see "First author"
    But I should not see "Second author"

  Scenario: Merging results in one title being chosen
    Given I edit an article
    When I fill in "merge_with" with "Second article"
    And I press "Merge"
    Then I should be on the article page
    And I should see "First title"
    But I should not see "Second title"

  Scenario: Merging results in comments being kept from both articles
    Given I edit an article
    When I fill in "merge_with" with "Second article"
    And I press "Merge"
    Then I should be on the article page
    And I should see "Comment from article 1"
    And I should see "Comment from article 2"

  Scenario: Merging requires an existing article
    Given I edit an article
    When I fill in "merge_with" with "Non-existant article"
    And I press "Merge"
    Then I should see "Article not found"
    And I should be on the article page
