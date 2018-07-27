Given "the admin logged in" do
	visit login_path
    fill_in 'Email', with: 'jackjones@gmail.com'
    fill_in 'Password', with: 'foobar'
    click_button 'Login'
end

When "I go to personal profile" do
    visit edit_user_path(User.find(1))
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

Then "I should be able to view user account" do
    expect(page).to have_selector(:link_or_button, 'Edit')
end

Then "I should be able to suspend website" do
    find('input#sospeso').click
    click_button 'Salva modifiche'
    expect(Site.first.suspended).to be_truthy
end
