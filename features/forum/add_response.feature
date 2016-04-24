Feature: Respond to posts on the forum
	As a user
	So I can give comments and answers on the posts 
	I want to comment on a post

Background: posts and responses have been added to the forum
	
	Given the following members exist:
	| name    | 	email         | position  |
	| author1 | author1@gmail.com | user      |
	| author2 | author2@gmail.com | user      |
	| admin | admin1@gmail.com  | admin |

	Given that I am logged in as "admin1@gmail.com"

	Given the following posts exist:
	| title   | 	author 	      | body  |
	| title1  | author1@gmail.com | body1 |
	| title2  | author2@gmail.com | body2 |

Scenario: add response to a post
	Given there should be "2" posts
	Given I add response "{body:'body'}" to "title1"
	Then post "title1" should have "1" responses

Scenario: response should validate body
	Given I add response "{}" to "title1"
	Then post "title1" should have "0" responses

Scenario: view responses to a post
	Given I am on the board page
	Then I should see post responses

Scenario: can delete response to post
	Given that I am logged in as "author1@gmail.com"
	Given I add response "{body:'body'}" to "title1"
	Given I delete response "body" on "title1"
	Then post "title1" should have "0" responses