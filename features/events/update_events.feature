Feature: udpate events on the events page
 
	As an event organizer
	So that I can accurately present upcoming events
	I want to be able to update and delete existing events on the events page

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


Scenario: delete an event
	Given that I am logged in as "davidbliu@gmail.com"
	When I delete "title1"
	Then there should be "4" events

Scenario: update an event
	Given that I am logged in as "davidbliu@gmail.com"
	When I update "title1" with "{title: 'randomtitle'}"
	Then there should be an event "randomtitle"

Scenario: update event with wrong params
	Given that I am logged in as "davidbliu@gmail.com"
	When I update "title1" with "{title: ''}"
	Then there should be an event "title1"