When "I go to problems" do
    click_link "Esercizi"
end

Then "I should be able to search a problem by keyword" do
    fill_in "search", with: "a"
    click_button "Cerca"
    visit search_path('')
    expect(page).to have_content("Nessun esercizio trovato")
end

Then "I should be able to search a problem by language" do
    select "Assembly", :from => "linguaggio"
    click_button "Cerca"
    expect(page).to have_content("Assembly")
end

Then "I should be able to propose a problem" do
    click_link "Proponi un esercizio"
    expect(page).to have_content("Titolo")    
end

