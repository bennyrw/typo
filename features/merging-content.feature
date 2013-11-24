Feature: Merging articles
  As the blog admin
  In order to prevent duplication of my content
  I want to support merging articles

  Background:
    Given the blog is set up
    # article ID 3 (#1 is Hello World, #2 is ???)
    And I am logged in as publisherOne
    When I go to the new article page
    And I fill in "article_title" with "Alphabet"
    And I fill in "article__body_and_extended_editor" with "Soup"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the homepage
    And I follow "Alphabet"
    And I fill in "comment_author" with "readerOne"
    And I fill in "comment_body" with "Comment from Alphabet"
    And I press "comment"
    And I log out
    # article ID 4
    When I am logged in as publisherTwo
    And I go to the new article page
    And I fill in "article_title" with "Zebra"
    And I fill in "article__body_and_extended_editor" with "Razzamataz"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the homepage
    And I follow "Zebra"
    And I fill in "comment_author" with "readerTwo"
    And I fill in "comment_body" with "Comment from Zebra"
    And I press "comment"
    And I log out
    # log back in as admin
    When I am logged into the admin panel

  Scenario: Editing an article displays merge button
    Given I am on the admin content page
    When I follow "Alphabet"
    Then I should see "Merge"

  Scenario: Merging with same article is not permitted
    Given I am on the admin content page
    When I follow "Alphabet"
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then I should see "Can not merge an article with itself"

  Scenario: Merging results in content being combined
    Given I am on the admin content page
    When I follow "Alphabet"
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should see "Articles merged"
    When I follow "Alphabet"
    Then I should see "Soup"
    And I should see "Razzamataz"

  Scenario: Merging results in one author being chosen
    Given I am on the admin content page
    When I follow "Alphabet"
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "publisherOne"
    But I should not see "publisherTwo"

  Scenario: Merging results in one title being chosen
    Given I am on the admin content page
    When I follow "Alphabet"
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should see "Alphabet"
    But I should not see "Zebra"

  Scenario: Merging results in comments being kept from both articles
    Given I am on the admin content page
    When I follow "Alphabet"
    And I fill in "merge_with" with "4"
    And I press "Merge"
    When I go to the home page
    And I follow "Alphabet"
    Then I should see "Comment from Alphabet"
    And I should see "Comment from Zebra"

  Scenario: Merging requires an existing article
    Given I am on the admin content page
    When I follow "Alphabet"
    And I fill in "merge_with" with "999"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Article not found"
