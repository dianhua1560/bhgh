Feature: Manage posts on the forum
	As an admin or tutor
	So I can publicize accurate comments on the posts
	I want to edit comments and posts (hide/approve posts/comments)

Background: posts and responses have been added to the forum

	Given the following posts exist:
<<<<<<< HEAD
	| title   | author                       | body   | post_ID |
	| title1 | admin1@gmail.com | body1 |     1        |
	| title2 | tutor1@gmail.com    | body2 |     2        |
=======
	| title   | author          | body  | post_ID |
	| title1 | admin1@gmail.com | body1 |   1     |
	| title2 | tutor1@gmail.com | body2 |   2     |
>>>>>>> 4929ff88999dda89c5419e733a58dab7c8a04a64

	Given the following members exist:
	| name | email | position |
	| admin1 | admin1@gmail.com | admin |
	| tutor1 | tutor1@gmail.com | tutor | 
	| scholar1 | scholar1@gmail.com | scholar | 

Scenario: Admin can see edit button for all posts
<<<<<<< HEAD
    Given that I am logged in as “admin1@gmail.com”
    When I visit “/forum”
    And I follow “title2”
    Then I should see “Edit Post”

Scenario: Scholars can not see edit button for all posts
    Given that I am logged in as “scholar1@gmail.com”
    When I visit “/forums”
    Given I follow “title1”
    Then I should not see “Edit Post”

Scenario: Admin can edit a post
    Given that I am logged in as “admin1@gmail.com”
    When I visit “/forum”
    And I edit post “title1”
    And I fill in “title” with “new title”
    When I press “Save Post”
    Then I should see “new title” 
=======
    Given that I am logged in as "admin1@gmail.com"
    When I visit "/forum"
    And I follow "title2"
    Then I should see "Edit Post"

Scenario: Scholars can not see edit button for all posts
    Given that I am logged in as "scholar1@gmail.com"
    When I visit "/forums"
    Given I follow "title1"
    Then I should not see "Edit Post"

Scenario: Admin can edit a post
    Given that I am logged in as "admin1@gmail.com"
    When I visit "/forum"
    And I edit post "title1"
    And I fill in "title" with "new title"
    When I press "Save Post"
    Then I should see "new title" 
>>>>>>> 4929ff88999dda89c5419e733a58dab7c8a04a64
	
Scenario: Admin can delete posts
	Given that I am logged in as "admin1@gmail.com"
	When I visit "/forum"
	And I delete post "title2"
	When I visit "/forum"
	Then I should not see "title1"

Scenario: Admin can see admin button
	Given that I am logged in as "admin1@gmail.com"
	When I visit "/forum"
	Then I should see "Admin Panel"

Scenario: Scholars cannot see admin button
	Given that I am logged in as "scholar1@gmail.com"
	When I visit "/forum"
	Then I should not see "Admin Panel"

Scenario: Admins can access admin panel
	Given that I am logged in as "admin1@gmail.com"
	Given I visit "/forum"
	Given I follow "Admin Panel"
	Then I should see "Forum Admin"
