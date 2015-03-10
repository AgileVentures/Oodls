feature 'User edits account' do

  before(:each) do
    User.create(:organisation => 'test charity',
                :contact_name => 'test name',
                :email => 'test@test.com',
                :password => 'password',
                :password_confirmation => 'password')
    sign_in
  end

  scenario 'should be able to go to an edit page' do
    click_link 'Edit account'
    expect(page).to have_content 'Edit your account'
  end

  scenario 'should be able to change their details or add more' do
    expect(page).to have_content 'test charity'
    edit_account_details
    expect(page).to have_content 'edited test charity'
  end 

end

feature 'User deletes account' do

  before(:each) do
    User.create(:organisation => 'test charity',
                :contact_name => 'test name',
                :email => 'test@test.com',
                :password => 'password',
                :password_confirmation => 'password')
    sign_in
  end

  scenario 'should be able to delete their account' do
    click_link 'Edit account'
    click_link 'Delete account'
    expect(User.count).to eq 0
    expect(current_path).to eq '/'
  end

end
