Feature: respond to events
	As an attendee
	So that I can let organizers know who to expect at their events
	I want to respond to events that I am going to and not going to

Background: events have been added to the database

	Given the following events exist:
	| title | description | time |
	| title1 | description1 | 1-May-2016 |
	| title2 | description2 | 2-May-2016 |
	| title3 | description3 | 3-May-2016 |
	| title4 | description4 | 4-May-2015 |
	| title5 | description5 | 5-May-2015 |


Scenario: respond going to an event
	Given that I am logged in as "asdf@gmail.com"
	Then I can post "Going" to "title1"