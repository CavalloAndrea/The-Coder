When "I go to forum" do
    click_link "Forum"
end

Then "I should be able to post something" do
    fill_in :id => "micropost_content", with: "a"
    click_button "Condividi"
    expect(page).to have_content("Post")
end

Then "I should be able to post an image" do
	find(:xpath, ".//input[@name='micropost[picture]']").click
	fill_in :id => "micropost_content", with: "a"
    click_button "Condividi"
    expect(page).to have_content("Post")
end

Then "I should be able to delete my post" do
	fill_in :id => "micropost_content", with: "a"
    click_button "Condividi"
    click_link "Elimina"
    expect(page).to have_content("Post")
end

Then "I should be able to view my followers" do
    find(:xpath, ".//strong[@id='followers']").click
    expect(page).to have_content("followers")
end

Then "I should be able to view my following" do
    find(:xpath, ".//strong[@id='following']").click
    expect(page).to have_content("following")
end
