Feature: Post on the forum
	As a user
	So that I can ask questions to my peers and tutors
	I want to add a post on the forum

Background: posts have been added to the forum
	Given the following members exist:
	| name | email | position |
	| scholar1 | scholar1@gmail.com | user | 
	| scholar2 | scholar2@gmail.com | user | 
	| admin1 | admin1@gmail.com | admin | 

	Given that I am logged in as "admin1@gmail.com"

	Given the following posts exist:
	| title  | author  | body |
	| title1 | admin1@gmail.com | body1 |
	| title2 | scholar1@gmail.com | body2 |

Scenario: user can see Create Post button
	Given that I am logged in as "scholar1@gmail.com"
	Then there should be "2" posts
	Given I am on the board page
	Then I should see "Post"

Scenario: create a post on the forum
	Given that I am logged in as "scholar1@gmail.com"
	Given I post "{title: 'title3', body:'body3'}" to "/forum/create"
	Then there should be "3" posts

Scenario: post should validate title
	Given that I am logged in as "scholar1@gmailcom"
	Given I post "{body:'somebody'}" to "/forum/create"
	Then there should be "2" posts

Scenario: post should validate author
	Given that I am logged in as "scholar1@gmail.com"
	Given I post "{author: '',title:'mytitle',body:'somebody'}" to "/forum/create"
	Then there should be "3" posts

Scenario: post should validate body
	Given that I am logged in as "scholar1@gmail.com"
	Given I post "{title:'title3'}" to "/forum/create"
	Then there should be "2" posts

Scenario: user can delete his own posts
	Given that I am logged in as "scholar1@gmail.com"
	Given I delete post "title2"
	Then there should be "1" posts

Scenario: user can not delete someone else's posts
	Given that I am logged in as "scholar1@gmail.com"
	Given I delete post "title1"
	Then there should be "2" posts


Scenario: post can be updated
	Given I update post "title1" with "{title:'newtitle'}"
	Then there should be a post with title "newtitle" 

Scenario: post cant be updated with bad params
	Given I update post "title1" with "{title: ''}"
	Then there should be a post with title "title1"