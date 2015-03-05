feature 'Existing User sign in' do

  scenario 'An Existing user should be able to enter sign in details' do
    visit '/charity'
    click_link 'Sign in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end

end
