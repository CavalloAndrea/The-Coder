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

