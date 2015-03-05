feature 'Creating listings' do
  
  before(:each) do
    User.create(:organisation => 'test charity',
                :contact_name => 'test name',
                :email => 'test@test.com',
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario 'A signed in user has a homepage' do
    sign_in
    expect(page).to have_content 'test charity\'s homepage' 
  end

  scenario 'A not signed in user cannot see homepage' do
    visit '/charity/home'
    expect(page).to have_content 'Please sign in to see your stuff'
  end

  scenario 'A signed in user can go to a page to create a listing' do
    sign_in
    expect(page).to have_content 'Create listing'
  end

end
