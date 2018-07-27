When "I go to map" do
    visit map_path
end

Then "I should be able to find Libraries" do
    expect(page).to have_content("Biblioteche")
end

Then "I should be able to find Book stores" do
    expect(page).to have_content("Librerie")
end