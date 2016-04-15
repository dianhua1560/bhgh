Feature: See posts on the forum
	As a user
	So that I can know what people are asking
	I want to view a list of posts on the forum

Background: posts have been added to the forum

	Given that I am logged in as "admin1@gmail.com"
	Given the following posts exist:
	| title  | author           | body  |
	| title1 | admin1@gmail.com | body1 |
	| title2 | admin1@gmail.com | body2 |

	

Scenario: view all forum posts
	Given I am on the board page
	Then there should be "2" posts

Scenario: view single forum post
	Given I am on the board page
	Then I should see a post with title "title2"
