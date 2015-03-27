#
class Oodls < Sinatra::Base

  get '/listings/new' do
    erb :'listings/new_listing_form'
  end

  post '/listings' do
    @user = current_user
    listing = Listing.create(donation_centre_address: params[:address],
                             donation_centre_postcode: params[:postcode],
                             weekday_opening_hours: params[:weekday_hours],
                             weekend_opening_hours: params[:weekend_hours],
                             user_id: @user.id)
    if listing.save
      redirect '/charity/home'
    else
      flash[:errors] = listing.errors.full_messages
      redirect '/listings/new'
    end
  end

end
