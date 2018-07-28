Feature: Problem language
As a user
I want to insert a language in a searchbar
So that I can search a problem

Scenario: An user searches a problem by language
Given the user logged in
When I go to problems
Then I should be able to search a problem by language
