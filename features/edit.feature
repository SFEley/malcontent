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
    Then I should see "New Content"
     And I should see a form element
    
  Scenario: Submitting new content
    Given no content
    When I go to /new
     And I fill in "Page Name" with "fred"
     And I fill in "Page Title" with "This is the page title."
     And I fill in "Body" with "This is some text."
     And I press "Create"
    Then I should see "This is the page title." 
     And I should see "Page created."
     And I should see "This is some text."
    
  Scenario: Edit Content link
    Given content named "billy"
    When I go to /billy
    Then I should see an "Edit" link
     And it should point to the edit content route for "billy"

  Scenario: Edit Content page
    Given content named "susan"
    When I go to /susan/edit
    Then I should see "Editing"
     And I should see a form element
     
  Scenario: Updating content
    Given content named "ethel"
    When I go to /ethel
     And I follow "Edit"
     And I fill in "Page Title" with "An updated page title."
     And I fill in "Body" with "Here's a totally different page body."
     And I press "Update"
    Then I should see "An updated page title."
     And I should see "Page updated."
     And I should see "Here's a totally different page body."
     
  Scenario: Delete link
    Given content named "jim"
    When I go to /jim
    Then I should see a "Delete" link
     And it should point to the delete content route for "jim"
     
  Scenario: Delete confirmation
    Given content named "boris"
    When I go to /boris
     And I follow "Delete"
    Then I should see "Are you sure you want to delete"
    
  Scenario Deleting content
    Given content named "boris"
    When I go to /boris
     And I follow "Delete"
     And I press "Delete"
    Then I should see "Page destroyed!"
     And I should see "Contents"
     