Feature: Deleting users
As an admin
I want to have special settings
So that I can to delete users

Scenario: An admin deletes an user
Given the admin logged in
When I go to users list
Then I should be able to delete users
