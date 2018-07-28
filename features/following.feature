Feature: Following
As a user
I want to go to Forum
So that I can view my following

Scenario: An user views his following
Given the user logged in
When I go to forum
Then I should be able to view my following
