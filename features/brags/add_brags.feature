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

	Given that I am logged in as "admin1@gmail.com"

Scenario: Admin can add a brag
	Given I post "{brag: {title: 'title2', subject: 'scholar1@gmail.com', body: 'body'}}" to "/brags/create_form"
	Then there should be "3" brags

Scenario: Brags should validate subject and body
	Given I post "{brag: {title: ''}}" to "/brags/create_form"
	Then there should be "2" brags


Scenario: Admin can edit brags
	Given I update brag "title1" with "{body:'newbody'}"
	Then there should be a brag with title "title1" and body "newbody"

Scenario: Admin can delete brags
	Given I delete brag "title1"
	Then there should be "1" brags

Scenario: admin can delete photos
	Given I delete photo for "title1"
	Then there should be "2" brags

Scenario: can get delete brags
	Given I get delete brag "title1"
	Then there should be "1" brags

Scenario: bad updates should fail
	Given I update brag "title1" with "{body:''}"
	Then there should be a brag with title "title1" and body "newbody"

