When "I go to map" do
    visit map_path
end

Then "I should be able to find Book store" do
    expect(page).to have_content("Book_Store")
end

Then "I should be able to find Libraries" do
    expect(page).to have_content("Library")
end