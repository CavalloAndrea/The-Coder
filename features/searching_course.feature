Feature: Course
As a user
I want to insert a keyword in a searchbar
So that I can search a course lesson

Scenario: An user searches a course lesson by keyword
Given the user logged in
When I go to home
Then I should be able to search a course lesson by keyword
