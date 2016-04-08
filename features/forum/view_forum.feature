Feature: See posts on the forum
	As a user
	So that I can know what people are asking
	I want to view a list of posts on the forum

Background: posts have been added to the forum

	Given the following posts exist:
	| title  | author           | body  |
	| title1 | admin1@gmail.com | body1 |
	| title2 | admin1@gmail.com | body2 |

Scenario: view all forum posts
	Given that I am logged in as "davidbliu@gmail.com"
	When I visit "/forum"
	Then I should see "title1"
	And I should see "title2"

Scenario: view single forum post
	Given that I am logged in as "davidbliu@gmail.com"
	When I visit "/brags"
	And I follow "title1"
	Then I should see "title1"
	And I should not see "title2"