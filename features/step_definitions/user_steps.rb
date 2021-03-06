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

When "I go to home page" do
    visit root_path
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
    expect(page).to have_content("attivare")
end

Then "I should be able to login with facebook" do
    expect(page).to have_content("Facebook")
end

Then "I should be able to change my e-mail" do
    fill_in 'Email', with: 'the2@coder.com'
    click_button "Salva modifiche"
    expect(User.find(2).email).to eq("the2@coder.com")
end

Then "I should be able to logout" do
    click_link "Logout"
    expect(page).to have_content("Benvenuti")
end

Then "I should be able to change my nickname" do
    fill_in 'Nickname', with: 'TheCoder'
    click_button "Salva modifiche"
    expect(User.find(2).nickname).to eq("TheCoder")
end

Then "I should be able to delete my account" do
    count = User.count
    click_button "Cancella il tuo account"
    expect(User.count).to eq(count-1)
end

Then "I should be able to change my profile in public or private" do
    find('input#user_privato').click
    click_button 'Salva modifiche'
    expect(User.find(2).privato).to be_truthy
end

Then "I should be able to change password" do
    fill_in 'Password', with: 'password2'
    fill_in :id => 'user_password_confirmation', with: 'password2'
    click_button "Salva modifiche"
    expect(page).to have_content("Profilo aggiornato correttamente")
end

Then "I should be able to change my language skills" do
    select "Esperto", :from => "user_istruzione"
    click_button "Salva modifiche"
    expect(User.find(2).istruzione).to eq("Esperto")
end

Then "I should be able to change my photo" do
    expect(page).to have_content("Cambia")
end

Then "I should be able to change my age" do
    fill_in :id => 'user_eta', with: '23'
    click_button "Salva modifiche"
    expect(User.find(2).eta).to eq('23')
end

Then "I should be able to change my gender" do
    choose(:id =>"user_sesso_uomo")
    click_button "Salva modifiche"
    expect(User.find(2).sesso).to eq('Uomo')
end
