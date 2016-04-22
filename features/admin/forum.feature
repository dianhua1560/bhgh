Feature: Manage posts on the forum
	As an admin or tutor
	So I can publicize accurate comments on the posts
	I want to edit comments and posts (hide/approve posts/comments)

Background: posts and responses have been added to the forum

	Given that I am logged in as "admin1@gmail.com"	

	Given the following members exist:
	| name | email | position |
	| admin1 | admin1@gmail.com | admin |
	| tutor1 | tutor1@gmail.com | tutor | 
	| scholar1 | scholar1@gmail.com | scholar | 

	Given the following posts exist:
	| title   | author          | body  | post_ID |
	| title1 | admin1@gmail.com | body1 |   1     |
	| title2 | tutor1@gmail.com | body2 |   2     |

Scenario: Admin can see edit button for all posts
	Given that I am logged in as "admin1@gmail.com"
	When I update post "title1" with "{title:'t'}"
	Then I should not see "not authorized"

Scenario: Scholars can not see edit button for all posts
	Given that I am logged in as "scholar1@gmail.com"
	When I update post "title1" with "{title:'t'}"
	Then I should see "not authorized"
	
Scenario: Admin can edit a post
	Given that I am logged in as "admin1@gmail.com"
	Given I update post "title1" with "{title:'newtitle'}"
	Then there should be a post with title "newtitle" 
	
Scenario: Admin can delete posts
	Given that I am logged in as "admin1@gmail.com"
	Given I delete post "title2"
	Then there should be "1" posts

Scenario: Admin can see admin button
	Given that I am logged in as "admin1@gmail.com"
	Then I should be able to use the admin page for post "title1"

Scenario: Scholars cannot see admin button
	Given that I am logged in as "scholar1@gmail.com"
	When I try to use the admin page for post "title1"
	Then I should see "not authorized"

Scenario: Admins can access admin panel
	Given that I am logged in as "admin1@gmail.com"
	Then I should be able to use the admin page for all posts
