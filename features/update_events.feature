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

Scenario: delete an event
	Given I am on the events page
	When I delete "title1"
	Then I should not see "title1"

Scenario: update an event
	Given I am on the events page
	When I click "Update title1"
	Then I should be on the update events page
	And I should see "Update title1"
	When I fill in description with "new description" 
	And I click "Update"
	Then I should be on the events page
	And I should see "new description"


