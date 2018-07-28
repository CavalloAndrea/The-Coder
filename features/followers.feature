Feature: Followers
As a user
I want to go to Forum
So that I can view my followers

Scenario: An user views his followers
Given the user logged in
When I go to forum
Then I should be able to view my followers
