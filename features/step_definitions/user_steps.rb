Given "the user logged in" do
    visit login_path
    fill_in 'Email', with: 'thecoder@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
end

When "I go to login page" do
    visit login_path
end

When "I go to sign up page" do
    visit signup_path
end

When "I write email and password" do
    fill_in 'Email', with: 'thecoder@gmail.com'
    fill_in 'Password', with: 'password'
end

Then "I should be able to sign up" do
    fill_in 'Nome', with: 'User'
    fill_in 'Email', with: 'thecoder@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Conferma Password', with: 'password'
    click_button "Registrati"
    expect(page).to have_content("activate")
end

Then "I should be able to login" do
    click_button "Login"
    expect(page).to have_content("following")
end

Then "I should be able to logout" do
    click_link "Logout"
    expect(page).to have_content("Logout effettuato con successo. Torna a trovarci!")
end

Then "I should be able to change my e-mail" do
    fill_in 'Email', with: 'thecoder2@gmail.com'
    click_button "Salva modifiche"
    expect(User.find(2).email).to eq("thecoder2@gmail.com")
end

Then "I should be able to change my password" do
    fill_in 'Password', with: 'password2'
    fill_in 'Conferma password', with: 'password2'
    click_button "Salva modifiche"
    expect(page).to have_content("Profile aggiornato correttamente")
end


Then "I should be able to delete my account" do
    count = User.count
    click_button "Cancella il tuo account"
    expect(User.count).to eq(count-1)
end

Then "I should be able to change my nickname" do
    fill_in 'Nickname', with: 'TheCoder'
    click_button "Salva modifiche"
    expect(User.find(2).nickname).to eq("TheCoder")
end

Then "I should be able to change my profile in public or private" do
    find('input#user_is_private').click
    click_button 'Salva modifiche'
    expect(User.find(2).is_private).to be_truthy
end