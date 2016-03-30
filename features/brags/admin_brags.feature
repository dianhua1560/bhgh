Feature: Admin page for bragboard
	As an admin
	So that I can publicize monitor engagement with brags
	I want to view an admin page

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

Scenario: Admin can see admin button
	Given that I am logged in as "admin1@gmail.com"
	Given I visit "/brags"
	Then I should see "Admin Panel"

Scenario: Scholars cannot see admin button
	Given that I am logged in as "scholar1@gmail.com"
	Given I visit "/brags"
	Then I should not see "Admin Panel"

Scenario: Scholars cannot access admin page

Scenario: Admins can access admin page
	Given that I am logged in as "admin1@gmail.com"
	Given I visit "/brags"
	Given I follow "Admin Panel"
	Then I should see "Brags Admin"


