require 'spec_helper'

feature 'Delete/Edit listings' do
  
  before(:each) do
    User.create(:id => 1,
                :organisation => 'test charity',
                :contact_name => 'test name',
                :email => 'test@test.com',
                :password => 'password',
                :password_confirmation => 'password')
  end

  before(:each) do
    Listing.create(:user_id => 1,
                   :donation_centre_address => '50 Commercial Street',
                   :donation_centre_postcode => 'E1 6LT',
                   :weekday_opening_hours => '9-6',
                   :weekend_opening_hours => '10-5')
  end

  scenario 'A signed in user can go to their homepage and edit their listings' do
    sign_in
    visit '/charity/home'
    expect(page).to have_content 'Your current listings: 50 Commercial Street E1 6LT Opening hours: Weekday: 9-6 Weekend: 10-5'
    click_link 'Edit this listing'
  end

end


