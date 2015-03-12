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
		sign_up
		expect(User.first.organisation).to eq 'test charity'
		expect(current_path).to eq '/charity/home'
		expect(page).to have_content 'Welcome test charity'
	end

	scenario 'should be notified if passwords don\'t match' do
		expect{ sign_up_mismatch_password }.to change(User, :count).by(0)
		expect(current_path).to eq '/charity/signup'	
		expect(page).to have_content 'Password does not match the confirmation'
	end

end
