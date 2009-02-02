Feature: home
  As a person who just installed this application
  I want to find a page called "home" at the root
  So that I have someplace to put all the other pages

  Scenario: Auto-creation
    Given no content
    When I go to /
    Then I should see "Home"
     And there should be one page

	Scenario: Edit home
	  Given no content
	  When I go to /edit
	  Then I should see a form element
	   And there should be one page
	   
	Scenario: Can't delete home
	  Given no content
	  When I go to /
	  Then I should not see "Delete"
	  
	Scenario: You REALLY can't delete home
	  Given no content
	  When I go to /
	   And I go to /delete
	  Then I should see "You can't delete"
	     
