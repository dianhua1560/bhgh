Feature: Respond to posts on the forum
	As a user
	So I can give comments and answers on the posts 
	I want to comment on a post

Background: posts and responses have been added to the forum

	Given the following posts exists:
	| title   | 	author 	      | body  | post_ID     |
	| title1  | author1@gmail.com | body1 |      1      |
	| title2  | author2@gmail.com | body2 |      2      |
	
	Given the following members exists:
	| name    | 	email         | position  |
	| author1 | author1@gmail.com | user      |
	| author2 | author2@gmail.com | user      |

	Given the following responses exists:
	| author            | post_ID     | body      |
	| author1@gmail.com |       1     | response1 |
	| author2@gmail.com |       2     | response2 |

Scenario: view responses to a post
	Given that I am logged in as “author1@gmail.com”
	When I visit “/forums”
	And I follow “title1”
	Then I should see “response1”
	And I should not see “response2”

Scenario: add response to a post
	Given that I am logged in as “author1@gmail.com”
	Given I visit “/forums”
	Given I follow “title2”
	Then I should see “title2”
  	And I should see “body2”
  	And I should see “response2”
        When I fill in “response” with “response3”
  	And I press “Save Response”
  	Then I should be on “/forums/2”
  	And I should see “response3”
  	When I visit “/forums”
  	And I follow “title1”
	Then I should not see “response3”

Scenario: response should validate body
	Given that I am logged in as “author1@gmail.com”
	Given I visit “/forums”
	Given I follow “title1”
	When I fill in “response” with “”
	And I press “Save Response”
	Then I should be on “/forums/1”
	And I should see “Errors”
