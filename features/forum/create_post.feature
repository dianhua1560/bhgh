Feature: Post on the forum
	As a user
	So that I can ask questions to my peers and tutors
	I want to add a post on the forum

Background: posts have been added to the forum

	Given the following posts exist:
	| title  | author  | body |
	| title1 | admin1@gmail.com | body1 |
	| title2 | scholar1@gmail.com | body2 |

	Given the following members exist:
	| name | email | position |
	| scholar1 | scholar1@gmail.com | user | 
	| scholar2 | scholar2@gmail.com | user | 
	| admin1 | admin1@gmail.com | admin | 

Scenario: user can see Create Post button
	Given that I am logged in as "scholar1@gmail.com"
	When I visit "/forum"
	Then I should see "Create Post"

Scenario: create a post on the forum
	Given that I am logged in as "scholar1@gmail.com"
	When I visit "/forum"
	And I follow "Create Post"
	When I fill in "title" with "new_title"
	When I fill in "author" with "scholar1@gmail.com"
	When I fill in "body" with "new_body"
	When I press "Post"
	Then I should see "new_title"

Scenario: post should validate title
	Given that I am logged in as "scholar1@gmail.com"
	When I visit "/forum/new"
	When I fill in "author" with "scholar1@gmail.com"
	When I fill in "body" with "new_body"
	When I press "Post"
	Then I should see "Errors"

Scenario: post should validate author
	Given that I am logged in as "scholar1@gmail.com"
	When I visit "/forum/new"
	When I fill in "title" with "new_title"
	When I fill in "body" with "new_body"
	When I press "Post"
	Then I should see "Errors"

Scenario: post should validate body
	Given that I am logged in as "scholar1@gmail.com"
	When I visit "/forum/new"
	When I fill in "author" with "scholar1@gmail.com"
	When I fill in "title" with "new_title"
	When I press "Post"
	Then I should see "Errors"

Scenario: user can delete his own posts
	Given that I am logged in as "scholar1@gmail.com"
	When I visit "/forum"
	When I follow "title1"
	Then I should see "Delete Post"

Scenario: user can not delete someone else's posts
	Given that I am logged in as "scholar2@gmail.com"
	When I visit "/forum"
	When I follow "title1"
	Then I should not see "Delete Post"