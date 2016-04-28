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
	Given I visit the admin page
	Then I should not see "not authorized"

Scenario: Scholars can not see edit button for all posts
	Given that I am logged in as "scholar1@gmail.com"
	Given I visit the admin page
	Then I should see "not authorized"
	
Scenario: Admin can edit a post
	Given that I am logged in as "admin1@gmail.com"
	Given I update post "title1" with "{title:'some_new_title'}"
	Then there should be a post with title "some_new_title" 
	
Scenario: Admin can delete posts
	Given that I am logged in as "admin1@gmail.com"
	Given I delete post "title2"
	Then there should be "1" posts

Scenario: Admin can see admin button
	Given that I am logged in as "admin1@gmail.com"
	Then I should see the admin page

Scenario: Scholars cannot see admin button
	Given that I am logged in as "scholar1@gmail.com"
	Given I am on the board page
	Then I should not see "admin"

Scenario: Admins can access admin panel
	Given that I am logged in as "admin1@gmail.com"
	Then I should see the admin page
	And I should see "Brags"