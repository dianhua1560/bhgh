Feature: add events to the events list
	As an event organizer
	So that I can publicize events
	I want to add events to the list of events on the events page

Background: events have been added to the database

	Given the following events exist:
	| title | description | time |
	| title1 | description1 | 1-May-2016 |
	| title2 | description2 | 2-May-2016 |
	| title3 | description3 | 3-May-2016 |
	| title4 | description4 | 4-May-2015 |
	| title5 | description5 | 5-May-2015 |

	Given the following members exist:
	| name | email | position |
	| David | davidbliu@gmail.com | admin | 
	| Alice | alice@gmail.com | tutor | 
	| Bob | bob@gmail.com | user |

Scenario: test google oauth
	Given that I am logged in as "davidbliu@gmail.com"
	
Scenario: add an event
	Given that I am logged in as "davidbliu@gmail.com"
	Given I post a sample event
	Then there should be "6" events

Scenario: normal user cannot add events
	Given that I am logged in as "asdf@gmail.com"
	Given I post a sample event
	Then there should be "5" events

Scenario: add bad event params
	Given that I am logged in as "davidbliu@gmail.com"
	Given I post a bad sample event
	Then there should be "5" events

Scenario: add members as admin
	Given that I am logged in as "davidbliu@gmail.com"
	Given I am on the members page
	Then I should see "Bob"
	Given I delete member "Bob"
	Given I am on the members page
	Then I should not see "Bob"

Scenario: admin can add admins
	Given that I am logged in as "davidbliu@gmail.com"
	Given that I post "{name: 'name', email: 'email@gmail.com', position: 'admin'}" to "/create_member"
	Given I am on the members page
	Then I should see "name"
