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

Scenario: add an event
	Given that I am logged in as "davidbliu@gmail.com"
	And I am on the events page
	Then I should see "Add Event"
	When I click on "Add Event"
	Then I should see "Add a new Event"
	When I fill out the event form with title: "newtitle" and description: "newdescription"
	And I press "Submit"
	Then I should see "newtitle"

Scenario: normal user cannot add events
	Given that I am logged in as "asdf@gmail.com"
	And I am on the events page
	Then I should not see "Add Event"

