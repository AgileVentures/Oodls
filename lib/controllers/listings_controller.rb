class Oodls < Sinatra::Base

  get '/listing/new' do
    erb :new_listing_form
  end

  post '/listings' do
    @user = current_user
    listing = Listing.create(:donation_centre_address => params[:address],
  						         :donation_centre_postcode => params[:postcode],
  							       :weekday_opening_hours => params[:weekday_hours],
  							       :weekend_opening_hours => params[:weekend_hours],
                       :charity_id => @user.id)
    redirect '/charity/home'
  end

end
