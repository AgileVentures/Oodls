def sign_up
	visit '/charity'
	click_link 'Sign up'
	fill_in :organisation, :with => 'test charity'
	fill_in :contact_name, :with => 'test name'
	fill_in :email, :with => 'test@test.com'
	fill_in :password, :with => 'password'
	fill_in :password_confirmation, :with => 'password'
	click_button 'Sign up'
end

def sign_up_mismatch_password
	visit '/charity'
	click_link 'Sign up'
	fill_in :organisation, :with => 'test charity'
	fill_in :contact_name, :with => 'test name'
	fill_in :email, :with => 'test@test.com'
	fill_in :password, :with => 'password'
	fill_in :password_confirmation, :with => 'wrong'
	click_button 'Sign up'
end

def sign_in
  visit '/charity'
  fill_in :email, :with => 'test@test.com'
  fill_in :password, :with => 'password'
  click_button 'Sign in'
end

def sign_in_wrong_details
  visit '/charity'
  fill_in :email, :with => 'test@test.com'
  fill_in :password, :with => 'wrong'
  click_button 'Sign in'
end

def edit_account_details
	visit '/charity/edit'
	fill_in :organisation, :with => 'edited test charity'
	fill_in :contact_name, :with => 'edited test name'
	fill_in :email, :with => 'edited_test@test.com'
	click_button 'Save changes'
end
