Feature: Edit Listing
  In order to correct a mistake
  As a user
  I want to edit a listing

  Scenario: Edit Listing
    Given I am logged in as a user with email "joe@example.com" and password "seekrit"
      And I have an existing listing titled "456 Mission St"
    When I change the title to "123 Mission St"
    Then I should see the corrected listing
  
  
  
