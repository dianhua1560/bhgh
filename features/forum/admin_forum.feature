Feature: Manage posts on the forum
	As an admin or tutor
	So I can publicize accurate comments on the posts
	I want to edit comments and posts (hide/approve posts/comments)

Background: posts and responses have been added to the forum

	Given the following posts exist:
	| title   | author          | body  | post_ID |
	| title1 | admin1@gmail.com | body1 |   1     |
	| title2 | tutor1@gmail.com | body2 |   2     |

	Given the following members exist:
	| name | email | position |
	| admin1 | admin1@gmail.com | admin |
	| tutor1 | tutor1@gmail.com | tutor | 
	| scholar1 | scholar1@gmail.com | scholar | 

Scenario: Admin can see edit button for all posts

Scenario: Scholars can not see edit button for all posts

Scenario: Admin can edit a post
	
Scenario: Admin can delete posts

Scenario: Admin can see admin button

Scenario: Scholars cannot see admin button

Scenario: Admins can access admin panel
