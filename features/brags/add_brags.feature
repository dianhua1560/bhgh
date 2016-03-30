Feature: Add brags to the bragboard
	As a tutor or an admin
	So that I can publicize accomplishments of students
	I want to add brags about students to the bragboard

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


Scenario: add a brag as an admin
	Given that I am logged in as "davidbliu@gmail.com"
	And I am on the bragboard
	Then I should see "Add Brag"
	When I follow "Add Brag"
	Then I should see "New Brag"
	When I fill in "title" with "newtitle"
	And I fill in "subject" with "newsubject"
	And I fill in "body" with "newbody"
	And I press "Post Brag"
	Then I should be on the bragboard
	And I should see "newtitle"

Scenario: scholars can not add brags
	Given that I am logged in as "bob@gmail.com"
	And I am on the bragboard
	Then I should not see "Add Brag"
