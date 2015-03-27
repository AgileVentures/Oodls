feature 'User forgets password' do

  before(:each) do
    User.create(:organisation => 'test charity',
                :contact_name => 'test name',
                :email => 'test@test.com',
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario 'should see forgot password link' do
    visit '/charity'
    expect(page).to have_link 'Forgot password?'
  end

  scenario 'should be able to go to a page and request a new password with their email' do
    visit '/charity'
    click_link 'Forgot password'
    fill_in :email, :with => 'test@test.com'
    click_button 'Send request'
    expect(page).to have_content 'We have sent you an e-mail with a reset link.'
    expect(User.first.token).not_to be nil
    expect(User.first.timestamp).not_to be nil
  end

  scenario 'should be able to access a new password form with their reset token' do
    visit '/charity'
    click_link 'Forgot password'
    fill_in :email, :with => 'test@test.com'
    click_button 'Send request'
    visit '/charity/reset_password/' + User.first.token
    fill_in :password, :with => 'newpassword'
    fill_in :password_confirmation, :with => 'newpassword'
    click_button 'Save'
  end 

  scenario 'should be able to login with their new details' do
    reset_password
    fill_in :email, :with => 'test@test.com'
    fill_in :password, :with => 'newpassword'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome test charity'
  end

  scenario 'should be asked to reapply for token if timed out' do
    visit '/charity'
    click_link 'Forgot password'
    fill_in :email, :with => 'test@test.com'
    click_button 'Send request'
    User.first.update(timestamp: User.first.timestamp - 3600)
    visit '/charity/reset_password/' + User.first.token
    expect(page).to have_content 'That token has expired, please request another'
    expect(current_path).to eq '/charity/request_token'
  end

end

