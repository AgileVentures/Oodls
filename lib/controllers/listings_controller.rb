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
    erb :listing_edit
  end

end
