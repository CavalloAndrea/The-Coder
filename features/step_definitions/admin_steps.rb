Given "the admin logged in" do
	visit login_path
    fill_in 'Email', with: 'admin@thecoder.com'
    fill_in 'Password', with: 'foobar'
    click_button 'Login'
end

When "I go to users list" do
    visit users_path
end

When "I go to private profile" do
    visit user_path(User.find(3))
end

When "I go to special options" do
    visit specialoptions_path
end

Then "I should be able to delete users" do
    expect(page).to have_content("elimina")
end

Then "I should be able to view user account" do
    expect(page).to have_content("Privato")
end

Then "I should be able to suspend website" do
    find('input#sospeso').click
    click_button 'Salva modifiche'
    expect(Site.first.sospeso).to be_truthy
end