Feature: TodoItemUI
	Add, edit, remove TodoItems

@tag1
Scenario: TodoItem CRUD
	Given the client configuration chrome
	Given user browser navigates to https://localhost:44318/
	When enters todoItemName in textbox and clicks Add
	Then verify the item exists in the list
	When user clicks the edit button for this item
	Then verify the edit area shows the item
	When user appends the name with 123 and clicks save
	Then verify the item exists in the list
	When user clicks the edit button for this item
	Then verify the edit area shows the item
	When user checks the complete box and clicks save
	Then verify the item complete box is checked in the list
	When user clicks the delete button for this item
	Then verify the item is no longer in the list


