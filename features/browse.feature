Feature: Browse Content
  As a visitor
  I want to view the content at the URL I enter
  So that I find value in coming here

Scenario: Content is not there
  Given no content
  When I go to /sample
  Then the request should fail

Scenario: Content is there
  Given content named "sample"
  When I go to /sample
  Then I should see the "sample" content

Scenario: Listing contents
  Given content titled "Bob"
    And content titled "Martha"
  When I go to /contents
  Then I should see "Bob" listed
   And I should see "Martha" listed
    