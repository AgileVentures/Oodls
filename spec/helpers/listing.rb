def fill_in_listing_form
  visit '/listings/new'
  fill_in :address, :with => '50 Commercial Street'
  fill_in :postcode, :with => 'E1 6LT'
  fill_in :weekday_hours, :with => '9-6'
  fill_in :weekend_hours, :with => '10-5'
  click_button 'Create listing'
end

def edit_listing_form
  visit '/listings/edit/:id'
  fill_in :address, :with => 'Another street'
  fill_in :postcode, :with => 'another postcode'
  fill_in :weekday_hours, :with => 'never'
  fill_in :weekend_hours, :with => 'always'
  click_button 'Save changes'
end

