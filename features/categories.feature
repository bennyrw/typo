Feature: Add and edit categories
  As the blog admin
  In order to keep everything organised so we can all find things
  I want to be able to add and edit categories for blog entries

  Background:
    Given the blog is set up
    When I am logged into the admin panel

  Scenario: Showing the categories screen
    Given I am on the admin content page
    When I follow "Categories"
    Then I should be on the admin categories page
