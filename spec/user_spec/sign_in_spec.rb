feature 'User signing in' do

  before(:each) do
    User.create(:organisation => 'test charity',
                :contact_name => 'test name',
                :email => 'test@test.com',
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario 'should be able to go to a sign in page' do
    visit '/charity'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end

  scenario 'should be able to successfully sign in' do
    sign_in
    expect(page).to have_content 'Welcome test charity'
  end

  scenario 'should be notified if login details are incorrect' do
    sign_in_wrong_details      
    expect(page).to have_content 'Your email or password is incorrect'
  end 

  scenario 'should be able to sign out' do
    sign_in
    click_link 'Sign out'
    expect(page).not_to have_content 'Welcome test charity'
    expect(page).to have_content 'Goodbye!'
  end

end
