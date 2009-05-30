Feature: Let users add books to discuss with the book club

	user story for feature

	Scenario: A logged in user adds a new book to discus
		Given a logged in user
		And there are no books on the site
		And I am on the add books page
		When I fill in "Title" with "The Rails Way"
		And I fill in "Author" with "Obie Fernandez"
		And I press "Add"
		Then I should see "Added: The Rails Way"

