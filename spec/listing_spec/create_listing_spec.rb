require 'spec_helper'

describe Listing do

	 it "should be created and then retrieved from the database" do
    expect(Listing.count).to eq 0
    Listing.create(donation_centre_address: 'address',
    						  donation_centre_postcode: 'postcode',
                  weekday_opening_hours: '9-6',
                  weekend_opening_hours: '10-5',
    						  user_id: 2
    						)
    expect(Listing.count).to eq 1
    Listing = Listing.first
    expect(listing.donation_centre_address).to eq 'address'
    expect(listing.donation_centre_postcode).to eq 'postcode'
    listing.destroy
    expect(Listing.count).to eq 0 
  end

end


feature 'Creating listings' do
  
  before(:each) do
    User.create(:id => '1',
                :organisation => 'test charity',
                :contact_name => 'test name',
                :email => 'test@test.com',
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario 'A signed in user has a homepage' do
    sign_in
    expect(page).to have_content 'Your current listings:'
  end

  scenario 'A not signed in user cannot see homepage' do
    visit '/charity/home'
    expect(page).to have_content 'Please sign in to see your stuff'
  end

  scenario 'A signed in user can go to a page to create a listing' do
    sign_in
    expect(page).to have_content 'Create listing'
  end

  scenario 'A signed in user can fill out a form to create a listing' do
    sign_in
    fill_in_listing_form
    expect(current_path).to eq '/charity/home'
    expect(page).to have_content 'test charity 50 Commercial Street'
  end

end
