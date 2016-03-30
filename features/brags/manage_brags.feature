Feature: Manage brags on bragboard
	As an admin or a tutor
	So that I can publicize accurate brags about students
	I want to be able to update the viewability of brags

Background: brags have been added to the bragboard

	Given the follow brags exist:
	| title  | subject  | body  | 
	| title1 | subject1 | body1 | 
	| title2 | subject2 | body2 | 
	| title3 | subject3 | body3 | 
	| title4 | subject4 | body4 | 

	Given the following members exist:
	| name  | email               | position |
	| David | davidbliu@gmail.com | admin    | 
	| Alice | alice@gmail.com     | tutor    | 
	| Bob   | bob@gmail.com       | user     |

Scenario: hide a brag
	Given that I am logged in as "davidbliu@gmail.com"
	And I am on the bragboard admin page
	And I hide "title1"
	When I go to the bragboard
	Then I should not see "title1"

Scenario: unhide a brag
	Given that I am logged in as "davidbliu@gmail.com"
	And I am on the bragboard admin page
	And I hide "title1"
	And I unhide "title1"
	When I go to the bragboard
	Then I should see "title1"