Feature: display list of events on the events page
 
	As a tutor
	So that I can know what events are upcoming
	I want to view a list of upcoming events on the events page

Background: events have been added to the database

  Given the following events exist:
  | title | description | time |
  | title1 | description1 | 1-May-2016 |
  | title2 | description2 | 2-May-2016 |
  | title3 | description3 | 3-May-2016 |
  | title4 | description4 | 4-May-2015 |
  | title5 | description5 | 5-May-2015 |

Scenario: view events on the page
  Given that I am logged in as "davidbliu@gmail.com"
  Then I can request the events list

