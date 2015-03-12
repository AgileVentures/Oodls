require 'spec_helper'

feature 'Show all listings' do
  
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

  scenario 'Any user can navigate to a page and see a list of all charities currently accepting donations' do
    visit '/listings/all'
    expect(page).to have_content 'Charities & Organisations currently accepting donations:'
  end

end

