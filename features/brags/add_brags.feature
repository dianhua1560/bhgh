Feature: Add brags to the bragboard
	As an admin
	So that I can publicize brags to tutors and other admins
	I want to add brags to the bragboard

Background: brags have been added to the bragboard

	Given the following brags exist:
	| title  | author  | subject  | body |
	| title1 | admin1@gmail.com | scholar1@gmail.com | body1 |
	| title2 | admin1@gmail.com | scholar2@gmail.com | body2 |

	Given the following members exist:
	| name | email | position |
	| admin1 | admin1@gmail.com | admin | 
	| tutor1 | tutor1@gmail.com | tutor |
	| scholar1 | scholar1@gmail.com | user | 
	| scholar2 | scholar2@gmail.com | user |

Scenario: Admin can see add button
	Given that I am logged in as "admin1@gmail.com"
	Given I visit "/brags"
	Then I should see "Add Brag"
	Given that I am logged in as "scholar1@gmail.com"
	Given I visit "/brags"
	Then I should not see "Add Brag"

Scenario: Admin can add a brag
	Given that I am logged in as "admin1@gmail.com"
	Given I visit "/brags"
	Given I follow "Add Brag"
	When I fill in "title" with "new_title"
	When I fill in "subject" with "scholar1@gmail.com"
	When I fill in "body" with "new_body"
	When I press "Save Brag"
	Then I should see "new_title"

Scenario: Brags should validate subject and body
	Given that I am logged in as "admin1@gmail.com"
	Given I visit "/brags/new"
	Given I press "Save Brag"
	Then I should see "Errors"

Scenario: Admin can edit brags
	Given that I am logged in as "admin1@gmail.com"
	Given I edit brag "title1"
	Given I fill in "title" with "updated title"
	When I press "Save Brag"
	Then I should see "updated title"

Scenario: I can include a photo
	Given that I am logged in as "admin1@gmail.com"
	Given I edit brag "title1"
	Given I fill in "photos" with "http://test.com/test.jpg"
	And I press "Save Brag"
	Given I edit brag "title1"
	Then I should see "http://test.com/test.jpg"

Scenario: Admin can delete brags
	Given that I am logged in as "admin1@gmail.com"
	Given I visit "/brags"
	Given I delete brag "title1"
	Given I visit "/brags"
	Then I should not see "title1"


