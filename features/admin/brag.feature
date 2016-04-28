Feature: Manage the bragboard as an admin
	As an administrator of the site 
	So that I can track engagement with and monitor use of the bragboard 
	I want to see an admin panel listing key metrics

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
	Then I should see the admin page

Scenario: Scholars cannot see admin button
	Given that I am logged in as "scholar1@gmail.com"
	Given I am on the board page
	Then I should not see "admin"

Scenario: Scholars cannot access admin page
	Given that I am logged in as "scholar1@gmail.com"
	Given I visit the admin page
	Then I should see "not authorized"

Scenario: Admins can access admin page
	Given that I am logged in as "admin1@gmail.com"
	Given I visit the admin page
	Then I should not see "not authorized"