feature 'Existing User sign in' do


  before(:each) do
    User.create(:organisation => 'test charity',
                :contact_name => 'test name',
                :email => 'test@test.com',
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario 'An Existing user should be able to enter sign in details' do
    visit '/charity'
    click_link 'Sign in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end

  scenario 'and should be able to successfully sign in' do
    sign_in
    expect(page).to have_content 'Logged in Successfully'
  end

end
