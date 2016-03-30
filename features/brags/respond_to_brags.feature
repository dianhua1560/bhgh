Feature: Respond to brags
	As a user
	So that I can show support to my peers and interact with brags
	I want to be able to like a brag

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

Scenario: like a brag
	Given that I am logged in as "bob@gmail.com"
	And I am on the bragboard
	And I press "Like"
	Then I should see "You liked this brag"