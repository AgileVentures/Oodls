require 'spec_helper'

feature 'User signing up' do 

	scenario 'should be able to go to a sign up page' do
		visit '/'
		click_link 'I\'m a Charity'
		expect(current_path).to eq '/charity'
		expect(page).to have_content 'Sign up'
		expect(page).to have_content 'Sign in'
	end

end