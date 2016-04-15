Feature: Like brags on bragboard
	As a tutor
	So that I can show my engagement with the material on brags
	I want to like brags on the bragboard

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

	Given that I am logged in as "admin1@gmail.com"

Scenario: like brag
	Given I like "title1"
	Then there should be "1" brag likes

Scenario: unlike brag
	Given I like "title1"
	Then there should be "1" brag likes
	Given I unlike "title1"
	Then there should be "0" brag likes



