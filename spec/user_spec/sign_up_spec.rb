require 'spec_helper'

feature 'User signing up' do 

	scenario 'should be able to go to a sign up page' do
		visit '/'
		click_link 'I\'m a Charity'
		expect(current_path).to eq '/charity'
		expect(page).to have_content 'Sign up'
		expect(page).to have_content 'Sign in'
	end

	scenario 'should see sign up form' do
		visit '/charity'
		click_link 'Sign up'
		expect(page).to have_content 'Email'
		expect(page).to have_content 'Password'
	end

	scenario 'should be able to sign up' do
		visit '/charity'
		click_link 'Sign up'
		fill_in :organisation, :with => 'test charity'
		fill_in :contact_name, :with => 'test name'
		fill_in :email, :with => 'test@test.com'
		fill_in :password, :with => 'password'
		click_button 'Sign up'
		expect(User.first.organisation).to eq 'test charity'
		expect(current_path).to eq '/charity'
		expect(page).to have_content 'Welcome test charity'
	end

end