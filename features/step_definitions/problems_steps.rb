When "I go to problems" do
    visit problems_path
end

Then "I should be able to search a problem by keyword" do
    fill_in "search", with: "a"
    click_button "Cerca"
    visit search_path('')
    expect(page).to have_content("Nessun esercizio trovato")
end

Then "I should be able to search a problem by language" do
    fill_in "linguaggio", with: "Java"
    click_button "Cerca"
    expect(page).to have_content("Esercizio Finale Java")
end
