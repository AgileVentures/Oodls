class Oodls < Sinatra::Base

  get '/listings/new' do
    erb :new_listing_form
  end

  post '/listings' do
    @user = current_user
    listing = Listing.create(:donation_centre_address => params[:address],
  						         :donation_centre_postcode => params[:postcode],
  							       :weekday_opening_hours => params[:weekday_hours],
  							       :weekend_opening_hours => params[:weekend_hours],
                       :user_id => @user.id)
    redirect '/charity/home'
  end

  get '/listings/all' do
    @listings = Listing.all
    erb :list_all_charities
  end

  get '/listings/edit/:id' do
    @listing = Listing.get(params[:id])
    erb :listing_edit
  end

  post '/listings/edit/:id' do
    altered_listing = Listing.get(params[:id])
    altered_listing.update(:donation_centre_address => update_model(:donation_centre_address, altered_listing),
                   :donation_centre_postcode => update_model(:donation_centre_postcode, altered_listing),
                   :weekday_opening_hours => update_model(:weekday_opening_hours, altered_listing),
                   :weekend_opening_hours => update_model(:weekend_opening_hours, altered_listing))
    flash[:notice] = 'Your listing has been updated'
    redirect '/charity/home'
  end

  get '/listings/delete' do
    listing.destroy
    flash[:notice] = 'You listing has been deleted'
    redirect '/charity/home'
  end

end
