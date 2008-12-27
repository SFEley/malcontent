Feature: edit
  As a site owner
  I want to create and edit content
  So that people won't think the domain is parked

  Scenario: New Content link
    Given no content
    When I go to /contents
    Then I should see a "New" link 
     And it should point to the new content route

  Scenario: New Content page
    Given no content
    When I go to /new
    Then I should see a form element
    
