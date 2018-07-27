Given "the user logged in" do
    visit login_path
    fill_in 'Email', with: 'utente1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
end

When "I go to login page" do
    visit login_path
end

When "I go to sign up page" do
    visit signup_path
end

When "I go to personal profile" do
	visit edit_user_path(User.find(2))
end

When "I write email and password" do
    fill_in 'Email', with: 'utente1@gmail.com'
    fill_in 'Password', with: 'password'
end

Then "I should be able to login" do
    click_button "Login"
end

Then "I should be able to sign up" do
    fill_in 'Nome', with: 'User'
    fill_in 'Email', with: 'the@coder.com'
    fill_in 'Password', with: 'password'
    fill_in 'Conferma Password', with: 'password'
    click_button "Registrati"
end

Then "I should be able to change my e-mail" do
    fill_in 'Email', with: 'the2@coder.com'
    click_button "Salva modifiche"
    expect(User.find(2).email).to eq("the2@coder.com")
end


