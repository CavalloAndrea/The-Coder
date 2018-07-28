When "I go to home" do
    visit root_path
end

Then "I should be able to search a course lesson by keyword" do
    fill_in "searching", with: "Hello"
    click_button "Cerca"
    expect(page).to have_content("C")
end

Then "I should be able to select a course language" do
    click_link "SQL"
    expect(page)
end

When "I go into a course language" do
    visit searching_path(0,'C')
end

Then "I should be able to select a language lesson" do
    expect(page).to have_content("C")
end


When "I go into a quiz" do
    visit quizzes_path(1)
end

Then "I should be able to complete a quiz" do
    expect(page)
end
