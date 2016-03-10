Feature: See brags on the bragboard
	As a user
	So that I can view the achievements of myself and my peers
	I want to view the brags on the bragboard

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

Scenario: view brags on the bragboard
	Given that I am logged in as "davidbliu@gmail.com"
	And I am on the bragboard
	Then I should see all the brags

Scenario: view single brag
	Given than I am logged in as "davidbliu@gmail.com"
	And I am on the bragboard
	When I follow "title1"
	Then I should see "title1"
	And I should see "subject1"
	And I should see "body1"
	And I should not see "body2"